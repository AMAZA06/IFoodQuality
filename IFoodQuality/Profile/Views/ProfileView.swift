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
        VStack {
            Spacer()
            PictureView(dataPicture: $profilPicture)
            ProfileFeaturesView(loginViewViewModel: loginViewViewModel)
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ProfileView(loginViewViewModel: LoginViewViewModel())
}
