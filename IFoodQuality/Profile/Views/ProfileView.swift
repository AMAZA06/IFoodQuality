//
//  ProfileView.swift
//  IFoodQuality
//
//  Created by amine maza on 03/04/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var loginViewViewModel: LoginViewViewModel
    
    @State var profilPicture: Data?
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .topLeading, endPoint: .bottom).edgesIgnoringSafeArea(.all) 
            VStack {
                Spacer()
                PictureView(dataPicture: $profilPicture)
                ProfileFeaturesView(loginViewViewModel: loginViewViewModel)
            }
        }
    }
}

#Preview {
    ProfileView(loginViewViewModel: LoginViewViewModel())
}
