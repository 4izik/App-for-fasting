//
//  String+Extension.swift
//  Fasts
//
//  Created by Настя on 05.02.2022.
//

import Foundation
extension String {
    /// Checks whether the string is valid email or not.
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z.'_%+-]+@[A-Za-z0-9.'-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

        return emailTest.evaluate(with: self)
    }

    /// Checks whether the string is valid password or not.
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}
