//
//  ViewController.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties

    let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    // MARK: - Add custom view

    private func setupUI() {
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.widthAnchor.constraint(equalTo: view.widthAnchor),
            loginView.heightAnchor.constraint(equalTo: view.heightAnchor),
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
}
