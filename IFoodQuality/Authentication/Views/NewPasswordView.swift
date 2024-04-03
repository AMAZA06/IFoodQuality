//
//  NewPasswordView.swift
//  IFoodQuality
//
//  Created by amine maza on 21/03/2024.
//

import SwiftUI

struct NewPasswordView: View {
    
    private let language = "EN"
    private let isPreviousPossible = true
    
    private let panelHeight = Double(UIScreen.main.bounds.height) / 4
    private let panelWidth = Double(UIScreen.main.bounds.width) / 1.15
    
    private let buttonHeight = Double(UIScreen.main.bounds.height / 20.0)

    @State private var password = ""
    @State private var newPassword = ""
    
    
    var body: some View {
        VStack {
            
            HeaderView(isPreviousPossible: isPreviousPossible)
            
            Spacer()
            
            
            HStack {
                Text(LocalizedStringKey("newpasswordview.title"))
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
                            SecureField(LocalizedStringKey("textfield.newpassword"), text: $password)
                        }
                        Section {
                            SecureField(LocalizedStringKey("textfield.validatepassword"), text: $newPassword)
                        }
                    }.frame(width: panelWidth * 0.95, alignment: .center)
                        .colorScheme(.light)
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                }
            }
            .frame(maxWidth: panelWidth, maxHeight: panelHeight, alignment: .center)
            
            Spacer()
                .frame(height: panelHeight / 8)
            
            PrimaryButtonView(buttonWidth: panelWidth, buttonHeight: buttonHeight, buttonLabel: String(localized: "button.send"))
            
            Spacer().frame(height: UIScreen.main.bounds.height / 3)
            
            
            
            
            
        }.background(Color(uiColor: .background)
            .frame(width: UIScreen.main.bounds.width * 2,
                   height: UIScreen.main.bounds.height * 2))
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
    }
}

#Preview {
    NewPasswordView()
}
