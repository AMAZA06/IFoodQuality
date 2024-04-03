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
    
    @Published var isLoggedIn = false
    @Published var error: String = ""
    
    func login() async {
        do {
            let responseData = try await AuthenticationApi().login(loginRequest:  LoginRequest(mail: username, password: password))
            await MainActor.run {
                self.isLoggedIn = true
                self.error = ""
                UserDefaults.standard.set(responseData.access_token, forKey:AppConstant.ACCESS_TOKEN.rawValue)
            }
        } catch {
            await MainActor.run {
                self.isLoggedIn = false
                self.error = error.localizedDescription
            }
        }
    }
    
    func logout() {
        isLoggedIn = false
        UserDefaults.standard.removeObject( forKey:AppConstant.ACCESS_TOKEN.rawValue)
    }
    
}
