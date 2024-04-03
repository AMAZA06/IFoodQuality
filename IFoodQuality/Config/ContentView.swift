//
//  ContentView.swift
//  IFoodQuality
//
//  Created by amine maza on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var loginViewModel = LoginViewViewModel()
    
    var body: some View {
        if (loginViewModel.isLoggedIn) {
            MenuView(loginViewViewModel: loginViewModel)
        } else {
            LoginView(loginViewViewModel: loginViewModel)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
