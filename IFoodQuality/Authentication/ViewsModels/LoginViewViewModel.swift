//
//  LoginViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 22/03/2024.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        AuthenticationApi().login(completion: {_ in
            
        }, loginRequest: LoginRequest(mail: username, password: password))
    }
    
    
}
