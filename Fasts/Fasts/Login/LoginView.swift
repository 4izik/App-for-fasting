//
//  StartView.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import Foundation
import UIKit

class LoginView: UIView {
    // MARK: - Definition UIElements

    private let nameAppImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo-1.svg")
        return imageView
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Log into your account or register"
        label.textColor = Colors.lblInformation
        label.textAlignment = .left
        label.font = UIFont(name: "Inter", size: 16)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.textColor = Colors.lblOnTextfield
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Inter", size: 16)
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Enter your e-mail", attributes:
            [NSAttributedString.Key.foregroundColor: Colors.tfPlaceholder])
        textField.textColor = Colors.tfText
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = Colors.tfBorder.cgColor
        return textField
    }()
    
    private let passwordlLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = Colors.lblOnTextfield
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Inter", size: 16)
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Enter your password", attributes:
            [NSAttributedString.Key.foregroundColor: Colors.tfPlaceholder])
        textField.textColor = Colors.tfText
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = Colors.tfBorder.cgColor
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passwordVisibleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector.png"), for: .normal)
        button.layer.cornerRadius = 6
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        button.clipsToBounds = true
        return button
    }()
    
    let loginButton = LoginButton(title: "Login")
    let signButton = LoginButton(title: "Sign up")

    // MARK: - Init

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }

    // MARK: - Setup View

    private func setupViews() {
        addSubview(nameAppImageView)
        addSubview(infoLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordlLabel)
        addSubview(passwordTextField)
        addSubview(passwordVisibleButton)
        addSubview(loginButton)
        addSubview(signButton)
        
        applyUIConstraints()
        passwordVisibleButton.addAction {
            self.changeVisibleProperty(textField: self.passwordTextField)
        }
    }

    // MARK: - Add constraints

    private func applyUIConstraints() {
        nameAppImageView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordlLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordVisibleButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameAppImageView.widthAnchor.constraint(equalToConstant: 160),
            nameAppImageView.heightAnchor.constraint(equalToConstant: 50),
            nameAppImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            nameAppImageView.topAnchor.constraint(equalTo: topAnchor, constant: super.bounds.height / 4),
            
            infoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            infoLabel.heightAnchor.constraint(equalToConstant: 20),
            infoLabel.widthAnchor.constraint(equalToConstant: 250),
            infoLabel.topAnchor.constraint(equalTo: nameAppImageView.bottomAnchor, constant: 25),
            
            emailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 45),
            emailLabel.heightAnchor.constraint(equalToConstant: 15),
            emailLabel.widthAnchor.constraint(equalToConstant: 150),
            emailLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 45),
            
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            
            passwordlLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 45),
            passwordlLabel.heightAnchor.constraint(equalToConstant: 15),
            passwordlLabel.widthAnchor.constraint(equalToConstant: 150),
            passwordlLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            passwordTextField.topAnchor.constraint(equalTo: passwordlLabel.bottomAnchor, constant: 10),
            
            passwordVisibleButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -20),
            passwordVisibleButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor,constant: 2),
            passwordVisibleButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -2),
            passwordVisibleButton.widthAnchor.constraint(equalToConstant: 20),
            
            loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            
            signButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            signButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20)
        ])
    }
    // MARK: - Сhanging items depending
    func changeVisibleProperty(textField: UITextField) {
        if textField.isSecureTextEntry {
            textField.isSecureTextEntry = false
        } else {
            textField.isSecureTextEntry = true
        }
    }
}
