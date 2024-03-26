//
//  CommonsValidator.swift
//  IFoodQuality
//
//  Created by amine maza on 22/03/2024.
//

import Foundation

struct CommonsValidator {
    static func validateEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPred.evaluate(with: email)
    }
        
    static func validatePassword(_ password: String) -> Bool {
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPred.evaluate(with: password)
    }
}
