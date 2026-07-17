//
//  CountryViewController.swift
//  CountryApp
//
//  Created by Ferid Suleymanzade on 14.07.26.
//
import UIKit

class CountryViewController: UIViewController{
    
    struct Country {
        let name: String
        let imageName: String
        let cities: [String]
    }
    
    let countries = [
        Country(
            name: "Azerbaijan",
            imageName: "azerbaijan",
            cities: ["Baku", "Ganja", "Shusha", "Gabala"]
        ),
        Country(
            name: "Turkiye",
            imageName: "turkey",
            cities: ["Ankara", "Istanbul", "Bursa", "Antalya"]
        ),
        Country(
            name: "France",
            imageName: "france",
            cities: ["Paris","Lyon","Marseille", "Nice"]
        ),
        Country(
            name: "Italy",
            imageName: "italy",
            cities: ["Rome", "Milan","Naples","Venice"]
        ),
        Country(
            name: "Netherland",
            imageName: "netherland",
            cities: ["Amsterdam", "Utrecht","Rotterdam","Den Haag"]
        )
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = .init(
            title: "LogOut",
            style: .plain,
            target: self,
            action: #selector(logoutAction))
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryCell")
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Country List"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc private func logoutAction() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.setLoginAsRoot()
            
        }
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
}

extension CountryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        cell.configure(with: countries[indexPath.row])
        return cell
        
        
    }
}

extension CountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityVC = CityViewController()
        cityVC.countryName = countries[indexPath.row].name
        cityVC.cities = countries[indexPath.row].cities
        navigationController?.pushViewController(cityVC, animated: true)
    }
}
