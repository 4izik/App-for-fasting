//
//  ViewController.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    // MARK: - Properties

    let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        addTapGestureToHideKeyboard()
        
        authorizeHealthKit()
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
        
        loginView.didTapCreateAccount = {
            self.showSignUp()
        }
        
        loginView.didTapLogin = { [self] in
            LoginAndSignUp(self).login(email: loginView.emailTextField, password: loginView.passwordTextField)
        }
    }
    private func showSignUp() {
        guard let vc = SignUpViewController() as? SignUpViewController else { return }
        self.present(vc, animated: true, completion: nil)
    }
    
    private func authorizeHealthKit() {
        HealthKitSetupAssistant.authorizeHealthKit {(authorized, error) in
          guard authorized else {
            let baseMessage = "HealthKit Authorization Failed"
                
            if let error = error {
              print("\(baseMessage). Reason: \(error.localizedDescription)")
            } else {
              print(baseMessage)
            }
            return
          }
          print("HealthKit Successfully Authorized.")
        }
    }
}
// MARK: - Adding a gesture

extension LoginViewController {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
