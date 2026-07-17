//
//  CountryTableViewCell.swift
//  CountryApp
//
//  Created by Ferid Suleymanzade on 14.07.26.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(flagImageView)
        contentView.addSubview(countryLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            
            flagImageView.widthAnchor.constraint(equalToConstant: 40),
            flagImageView.heightAnchor.constraint(equalToConstant: 40),
            
            countryLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 16),
            countryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with country: Country) {
        countryLabel.text = country.name
        flagImageView.image = UIImage(named: country.imageName)
    }
    
}

