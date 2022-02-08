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
    var didTapCreateAccount: (() -> Void)?
    var didTapLogin: (() -> Void)?
    
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
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        let buttonAttributes : [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                               NSAttributedString.Key.foregroundColor: Colors.btnForgotPasswordTitle,
                                                               NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]

        button.setAttributedTitle(NSAttributedString(string: "Forgot password?",
                                                     attributes: buttonAttributes), for: .normal)
        return button
    }()
    
    private let continueLabel: UILabel = {
        let label = UILabel()
        label.text = "------------- Or continue with ------------"
        label.textColor = Colors.lblPassive
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let googleButton = SocialMediaButton(image: "Google")
    let appleButton = SocialMediaButton(image: "Apple")
    let facebookButton = SocialMediaButton(image: "Facebook")
    
    let socialMediaStackView = UIStackView()
    
    let createAccountMailButton: UIButton = {
        let button = UIButton()
        let buttonAttributes : [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                               NSAttributedString.Key.foregroundColor: Colors.btnForgotPasswordTitle,
                                                               NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]

        button.setAttributedTitle(NSAttributedString(string: "Create account with e-mail",
                                                     attributes: buttonAttributes), for: .normal)
        return button
    }()
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
        addSubview(forgotPasswordButton)
        addSubview(continueLabel)
        addSubview(socialMediaStackView)
        addSubview(createAccountMailButton)

        createSocialMediaStackView()
        applyUIConstraints()
        passwordVisibleButton.addAction {
            self.changeVisibleProperty(textField: self.passwordTextField)
        }
        createAccountMailButton.addAction {
            self.didTapCreateAccount?()
        }
        
        loginButton.addAction {
            self.didTapLogin?()
        }
    }
    
    private func createSocialMediaStackView() {
        socialMediaStackView.addArrangedSubview(googleButton)
        socialMediaStackView.addArrangedSubview(appleButton)
        socialMediaStackView.addArrangedSubview(facebookButton)
        socialMediaStackView.axis = .horizontal
        socialMediaStackView.distribution = .fillEqually
        socialMediaStackView.spacing = 20
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
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        continueLabel.translatesAutoresizingMaskIntoConstraints = false
        socialMediaStackView.translatesAutoresizingMaskIntoConstraints = false
        createAccountMailButton.translatesAutoresizingMaskIntoConstraints = false
        
        var constantHeightImage: CGFloat = 0
        if UIScreen.main.bounds.height < 700 {
            constantHeightImage = 50
        } else {
            constantHeightImage = UIScreen.main.bounds.height / 4
        }
        
        NSLayoutConstraint.activate([
            nameAppImageView.widthAnchor.constraint(equalToConstant: 160),
            nameAppImageView.heightAnchor.constraint(equalToConstant: 50),
            nameAppImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            nameAppImageView.topAnchor.constraint(equalTo: topAnchor, constant: constantHeightImage),
            
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
            
            forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 150),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            
            loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20),
            
            continueLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            continueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            continueLabel.heightAnchor.constraint(equalToConstant: 20),
            continueLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            
            socialMediaStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            socialMediaStackView.heightAnchor.constraint(equalToConstant: 50),
            socialMediaStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            socialMediaStackView.topAnchor.constraint(equalTo: continueLabel.bottomAnchor, constant: 20),
            
            createAccountMailButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            createAccountMailButton.rightAnchor.constraint(equalTo: rightAnchor,constant: -30),
            createAccountMailButton.heightAnchor.constraint(equalToConstant: 20),
            createAccountMailButton.topAnchor.constraint(equalTo: socialMediaStackView.bottomAnchor, constant: 30)
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
