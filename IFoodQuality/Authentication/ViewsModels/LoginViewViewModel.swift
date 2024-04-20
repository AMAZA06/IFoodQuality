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
    @Published var errorMessage : String?
    
    func login() async {
        do {
            let loginResponseData = try await AuthenticationApi().login(loginRequest:  LoginRequest(mail: username, password: password))
            await updateUI(loginResponseData: loginResponseData)
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    func logout() {
        isLoggedIn = false
        UserDefaults.standard.removeObject( forKey:AppConstant.ACCESS_TOKEN.rawValue)
    }
    
    
    @MainActor
    func updateUI(loginResponseData: LoginResponseData) {
        isLoggedIn = true
        errorMessage = nil
        UserDefaults.standard.set(loginResponseData.access_token, forKey:AppConstant.ACCESS_TOKEN.rawValue)
    }
    
    @MainActor
    private func reportError(_ error: String) {
        isLoggedIn = false
        errorMessage = error
    }
    
}
