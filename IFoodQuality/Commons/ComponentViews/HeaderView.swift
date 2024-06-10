//
//  HeaderView.swift
//  IFoodQuality
//
//  Created by amine maza on 17/03/2024.
//

import SwiftUI

struct HeaderView: View {
    
    private var isPreviousPossible = false
    var language = "EN"
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height:UIScreen.main.bounds.height / 30)
            HStack {
                if (isPreviousPossible) {
                    Button(action: {
                        
                    }, label: {
                        Circle()
                            .foregroundColor(Color(uiColor: .regularButton))
                            .overlay(Image(systemName: "arrow.left"
                                    ).foregroundColor(.regularFont))
                            .frame(width: 40, height: 40)
                    })
                } else {
                    Spacer()
                        .frame(width: 40, height: 40)
                }
                
                Spacer()
                
                Text(LocalizedStringKey("appname"))
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {}, label: {
                    Circle()
                        .foregroundColor(.regularButton)
                        .overlay(
                    Text(language)
                        .foregroundColor(.regularFont)
                        .multilineTextAlignment(.center))
                    .frame(width: 40, height: 40)
                })
            }.padding()
        }

    }
}

#Preview {
    HeaderView()
}
