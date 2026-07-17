//
//  CityDetailViewController.swift
//  CountryApp
//
//  Created by Ferid Suleymanzade on 17.07.26.
//

import UIKit

class CityDetailViewController: UIViewController {
    var city: City?
    
    let cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.backgroundColor = .clear
        return textView
    }()
    
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = city?.name
        
        view.addSubview(cityImageView)
        view.addSubview(descptionTextView)
        
        configure()
        
        NSLayoutConstraint.activate([
            cityImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cityImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cityImageView.heightAnchor.constraint(equalToConstant: 300),
        
            descptionTextView.topAnchor.constraint(equalTo: cityImageView.bottomAnchor, constant: 20),
            descptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        
    }
    
    private func configure() {
        guard let city else { return }
        
        cityImageView.image = UIImage(named: city.imageName)
        
        descptionTextView.text = city.description
    }
    
    
    
    
}
