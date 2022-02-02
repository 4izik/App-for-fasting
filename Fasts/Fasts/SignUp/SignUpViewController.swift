//
//  SignUoViewController.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - Properties

    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // MARK: - Add custom view

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(signUpView)
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            signUpView.heightAnchor.constraint(equalTo: view.heightAnchor),
            signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
}
