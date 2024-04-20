//
//  LoginView.swift
//  IFoodQuality
//
//  Created by amine maza on 19/03/2024.
//

import SwiftUI

struct LoginView: View {
    private let isPreviousPossible = false
        
    private let panelHeight = Double(UIScreen.main.bounds.height) / 4
    private let panelWidth = Double(UIScreen.main.bounds.width) / 1.15
        
    private let buttonHeight = Double(UIScreen.main.bounds.height / 20.0)
    
    @ObservedObject var loginViewViewModel: LoginViewViewModel
        
    var body: some View {
        VStack {
            HeaderView()
            
            Spacer()
            
            Text(LocalizedStringKey("welcome"))
                
            Spacer()
            
            HStack {
                Text(LocalizedStringKey("loginview.title"))
                    .frame(maxWidth: UIScreen.main.bounds.width
                           , alignment: .leading)
            }.frame(width: panelWidth)
            
            ZStack {
                
                VStack {
                    Form {
                        Section {
                            TextField(LocalizedStringKey("textfield.username"), text: $loginViewViewModel.username)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                            
                        }
                        Section {
                            SecureField(LocalizedStringKey("textfield.password"), text: $loginViewViewModel.password)
                        }
                    }.frame(width: panelWidth * 0.95, height: 200,alignment: .center)
                        .colorScheme(.light)
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                    
                    if (!loginViewViewModel.isLoggedIn &&
                        loginViewViewModel.errorMessage != nil) {
                        Text(loginViewViewModel.errorMessage!)
                            .foregroundColor(.red)
                        Spacer()
                    }
                }.frame(maxHeight: panelHeight / 1.5)
            }
            .frame(maxWidth: panelWidth, maxHeight: panelHeight, alignment: .center)
            
            Spacer()
            
            PrimaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.send"), systemImage: "")
            }, action: {
                Task {
                    await loginViewViewModel.login()
                }
            }).padding(.bottom, UIScreen.main.bounds.height / 3)
            
            
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .topLeading, endPoint: .bottom)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        
    }
}

#Preview {
    LoginView(loginViewViewModel: LoginViewViewModel())
}
