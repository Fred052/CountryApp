//
//  LoginViewController.swift
//  CountryApp
//
//  Created by Ferid Suleymanzade on 10.07.26.
//
import UIKit

class LoginViewController: UIViewController {
    
    let emailtextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordtextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        return button
    }()

    let errorLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .red
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.isHidden = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        
        view.addSubview(emailtextField)
        view.addSubview(passwordtextField)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            emailtextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            emailtextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailtextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailtextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            passwordtextField.topAnchor.constraint(equalTo: emailtextField.bottomAnchor, constant: 20),
            passwordtextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordtextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordtextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordtextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -20)
        ])
    }
    
    @objc private func loginTapped() {
        let email = emailtextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordtextField.text ?? ""
        
        if email.isEmpty {
            errorLabel.isHidden = false
            errorLabel.text = "Zəhmət olmasa, e-poçt ünvanı daxil edin."
            return
        }
        
        if password.isEmpty {
            errorLabel.isHidden = false
            errorLabel.text = "Zəhmət olmasa, şifrə daxil edin."
            return
        }
        
        if password.count < 5 {
            errorLabel.isHidden = false
            errorLabel.text = "Şifrə 5 simvoldan az olmamalıdır."
            return
        }
        
        if password.count > 10 {
            errorLabel.isHidden = false
            errorLabel.text = "Şifrə 10 simvoldan çox olmamalıdır."
            return
        }
        
        errorLabel.isHidden = true
        errorLabel.text = ""
        
        let countryVC = CountryViewController()
        navigationController?.pushViewController(countryVC, animated: true)
    }
}
