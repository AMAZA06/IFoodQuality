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
    
    
    @FocusState var isFocused: UUID?
    @State var textfieldsIds: [UUID] = [
        UUID(),
        UUID()
    ]
        
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
            
            VStack {
                if (!loginViewViewModel.isLoading) {
                    PrimaryTextFieldView(text: $loginViewViewModel.username, label: LocalizedStringKey("textfield.username"), isFocused: _isFocused, textfieldId: $textfieldsIds[0])
                        .padding(.bottom, 8)
                    PrimaryTextFieldView(text: $loginViewViewModel.password, label: LocalizedStringKey("textfield.password"), isFocused: _isFocused, textfieldId: $textfieldsIds[1], isPassword: true)
                        .padding(.bottom, 8)
                    
                    if (!loginViewViewModel.isLoggedIn &&
                        loginViewViewModel.errorMessage != nil) {
                        Text(loginViewViewModel.errorMessage!)
                            .foregroundColor(.red)
                    }
                } else {
                    HStack(alignment: .center) {
                        Spacer()
                        LoadingView()
                        Spacer()
                    }
                }
                
            }.frame(width: panelWidth, height: 220, alignment: .leading)
            
            Spacer()
            
            PrimaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.send"), systemImage: "")
            }, action: {
                Task {
                    await loginViewViewModel.login()
                }
            }).padding(.bottom, UIScreen.main.bounds.height / 3)
            
            
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        
    }
}

#Preview {
    LoginView(loginViewViewModel: LoginViewViewModel())
}
