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
    
    private func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "okey", style: .default))
        
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        
        view.addSubview(emailtextField)
        view.addSubview(passwordtextField)
        view.addSubview(loginButton)
        
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
            loginButton.topAnchor.constraint(equalTo: passwordtextField.bottomAnchor, constant: 100),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func loginTapped() {
        let email = emailtextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordtextField.text ?? ""
        
        if email.isEmpty {
            showAlert(title: "Error", message: "Email cannot be empty.")
        }
    }
}
