//
//  LoginView.swift
//  IFoodQuality
//
//  Created by amine maza on 19/03/2024.
//

import SwiftUI

struct LoginView: View {
    private let language = "EN"
    private let isPreviousPossible = false
        
    private let panelHeight = Double(UIScreen.main.bounds.height) / 4
    private let panelWidth = Double(UIScreen.main.bounds.width) / 1.15
        
    private let buttonHeight = Double(UIScreen.main.bounds.height / 20.0)
    
    @ObservedObject private var loginViewModel = LoginViewViewModel()
        
    var body: some View {
        VStack {
            HeaderView(language: language, isPreviousPossible: isPreviousPossible)
            
            Spacer()
            
            Text(LocalizedStringKey("welcome"))
                
            Spacer()
            
            
            HStack {
                Text(LocalizedStringKey("loginview.title"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(width: panelWidth)
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(.panel)
                    .opacity(0.3)
                    .shadow(radius: 20)
                    .cornerRadius(6.0)
                
                VStack {
                    Form {
                        Section {
                            TextField(LocalizedStringKey("textfield.username"), text: $loginViewModel.username)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                            
                        }
                        Section {
                            SecureField(LocalizedStringKey("textfield.password"), text: $loginViewModel.password)
                        }
                    }.frame(width: panelWidth * 0.95, alignment: .center)
                        .colorScheme(.light)
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                }
            }
            .frame(maxWidth: panelWidth, maxHeight: panelHeight, alignment: .center)
            
            Spacer()
            
            PrimaryButtonView(buttonWidth: panelWidth, buttonHeight: buttonHeight, buttonLabel: String(localized:"button.send"), action: loginViewModel.login)
            
            Spacer().frame(height: UIScreen.main.bounds.height / 3)
            
        }.background(Color(uiColor: .background)
            .frame(width: UIScreen.main.bounds.width * 2,
                   height: UIScreen.main.bounds.height * 2))
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        
    }
}

#Preview {
    LoginView()
}
