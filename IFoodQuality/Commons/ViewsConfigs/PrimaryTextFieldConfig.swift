//
//  PrimaryTextFieldConfig.swift
//  IFoodQuality
//
//  Created by amine maza on 25/04/2024.
//

import SwiftUI

struct PrimaryTextFieldConfig: TextFieldStyle {
    
    var width: CGFloat
    var height: CGFloat
    
    @Binding var isFocused: Bool
    
    func _body(configuration:  TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(.textField)
                .frame(width: width ,height: height)
                .overlay(alignment: .leading) {
                    Rectangle()
                        .stroke(.textFieldBorder)
                        .frame(width: isFocused ? width - 10 : 0 ,height: 0.5)
                        .animation(.linear(duration: 0.2), value: isFocused)
                        .offset(CGSize(width: 5, height: 20))
                }
            
            configuration
                .padding(.leading, 5)
                .clipShape(Rectangle())
            
            
        }
    }
}
