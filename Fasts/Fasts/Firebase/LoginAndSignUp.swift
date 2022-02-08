//
//  LoginAndSignUp.swift
//  Fasts
//
//  Created by Настя on 07.02.2022.
//

import Foundation
import Firebase
import UIKit

class LoginAndSignUp {
    var viewController: UIViewController?
    init(_ vc: UIViewController) {
        viewController = vc
    }
    
    func login(email: UITextField, password: UITextField) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
           if error == nil{
               self.showDashboard()
                          }
            else{
             let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
              alertController.addAction(defaultAction)
                self.viewController?.present(alertController, animated: true, completion: nil)
                 }
        }
    }
    
    func showDashboard() {
        guard let vc = DashboardViewController() as? DashboardViewController else { return }
        self.viewController?.present(vc, animated: true, completion: nil)
    }
    
    func signUp(email: UITextField, password: UITextField) {
        if password.text!.isValidPassword() != true || email.text!.isValidEmail() != true {
            presentInvalidPasswordAlert()
                } else {
                    Auth.auth().createUser(withEmail: email.text!, password: password.text!) { [self] (user, error) in
         if error == nil {
             presentRegistrationCompleteAlert()
                        } else {
                            presentErrorSignUpAlert(error: error)
               }
                    }
              }
        }
    
    // MARK: - Present Alerts
    
    private func presentInvalidPasswordAlert() {
        let alertController = UIAlertController(title: "Password or Email Invalid", message: "Please enter a valid password and emai", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
        alertController.addAction(defaultAction)
        self.viewController?.present(alertController, animated: true, completion: nil)
    }
    
    private func presentRegistrationCompleteAlert() {
        let alertController = UIAlertController(title: "Complete", message: "Registration completed successfully", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.viewController?.dismiss(animated: true, completion: nil)
        })
                    
        alertController.addAction(defaultAction)
        self.viewController?.present(alertController, animated: true, completion: nil)
    }
    
    private func presentErrorSignUpAlert(error: Error?) {
        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                         
         alertController.addAction(defaultAction)
        self.viewController?.present(alertController, animated: true, completion: nil)
    }
}
