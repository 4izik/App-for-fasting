//
//  SignUoViewController.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    // MARK: - Properties

    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        addTapGestureToHideKeyboard()
    }
    
    // MARK: - Add custom view

    private func setupUI() {
        view.addSubview(signUpView)
        view.backgroundColor = .white
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            signUpView.heightAnchor.constraint(equalTo: view.heightAnchor),
            signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        signUpView.didTapBackToLogin = {
            self.dismiss(animated: true, completion: nil)
        }
        
        signUpView.didTapSignUp = { [self] in
            LoginAndSignUp(self).signUp(email: signUpView.emailTextField, password: signUpView.passwordTextField)
        }
    }

}
// MARK: - Adding a gesture

extension SignUpViewController {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
