//
//  ProfileFeaturesView.swift
//  IFoodQuality
//
//  Created by amine maza on 05/04/2024.
//

import SwiftUI

struct ProfileFeaturesView: View {
    
    @ObservedObject var loginViewViewModel: LoginViewViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                List {
                    Section {
                        ForEach(ProfileFeatures.allCases, id: \.self) { profileFeature in
                            NavigationLink(value: profileFeature ) {
                                Text(profileFeature.title)
                            }
                        }
                    }.foregroundColor(.white)
                    
                    Section(LocalizedStringKey("")) {
                        Button("logout") {
                            loginViewViewModel.logout()
                        }.foregroundColor(.white)
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationDestination(for: ProfileFeatures.self) { profileFeature in
                    profileFeature.view
                }
            }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all))
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ProfileFeaturesView(loginViewViewModel: LoginViewViewModel())
}
