//
//  ProfileView.swift
//  IFoodQuality
//
//  Created by amine maza on 03/04/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var loginViewViewModel: LoginViewViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .cornerRadius(8.0)
                    .foregroundColor(.panel)
                
                Button("logout") {
                    loginViewViewModel.logout()
                }
            }.frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
            
        }.background(Color(uiColor: .background)
            .frame(width: UIScreen.main.bounds.width * 2,
                   height: UIScreen.main.bounds.height * 2))
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
    }
}

#Preview {
    ProfileView(loginViewViewModel: LoginViewViewModel())
}
