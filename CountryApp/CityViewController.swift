//
//  CityViewController.swift
//  CountryApp
//
//  Created by Ferid Suleymanzade on 14.07.26.
//

import UIKit

class CityViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var cities: [String] = []
    
    var countryName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad( )
        title = countryName
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "CityCell")
        
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        cell.textLabel?.font = .boldSystemFont(ofSize: 18)
        return cell
    }
    
    
}
