//
//  SignUpView.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import Foundation
import UIKit

class SignUpView: UIView {
    // MARK: - Definition UIElements
    
    private let nameAppImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo-1.svg")
        return imageView
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
        addSubview(loginButton)
        addSubview(signButton)
        applyUIConstraints()
    }

    // MARK: - Add constraints

    private func applyUIConstraints() {
        nameAppImageView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameAppImageView.widthAnchor.constraint(equalToConstant: 160),
            nameAppImageView.heightAnchor.constraint(equalToConstant: 50),
            nameAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameAppImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
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
}
