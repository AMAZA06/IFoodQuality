//
//  PrimaryTextFieldView.swift
//  IFoodQuality
//
//  Created by amine maza on 25/04/2024.
//

import SwiftUI

struct PrimaryTextFieldView: View {
    
    var width: CGFloat = UIScreen.main.bounds.width * 0.8
    var height: CGFloat = 55
    
    @Binding var text: String
    var label: LocalizedStringKey = "Button label"
    
    @FocusState var isFocused : UUID?
    @Binding var textfieldId: UUID
    @State var isFocusedState: Bool = false
    
    var isPassword = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            if (!isPassword) {
                TextField(label, text: $text)
                    .textFieldStyle(PrimaryTextFieldConfig(width: width, height: height, isFocused: $isFocusedState ))
                    .focused($isFocused, equals: textfieldId)
                    .onChange(of: isFocused) { oldValue, newValue in
                        
                        if let isFocused = isFocused {
                            if (isFocused == textfieldId) {
                                isFocusedState = true
                            } else {
                                isFocusedState = false
                            }
                        } else {
                            isFocusedState = false
                        }
                    }
                    .foregroundColor(.white)
            } else {
                SecureField(label, text: $text)
                    .textFieldStyle(PrimaryTextFieldConfig(width: width, height: height, isFocused: $isFocusedState ))
                    .focused($isFocused, equals: textfieldId)
                    .onChange(of: isFocused) { oldValue, newValue in
                        
                        if let isFocused = isFocused {
                            if (isFocused == textfieldId) {
                                isFocusedState = true
                            } else {
                                isFocusedState = false
                            }
                        } else {
                            isFocusedState = false
                        }
                    }
                    .foregroundColor(.white)
            }
           
            
            if(!text.isEmpty) {
                Text(label)
                    .foregroundColor(.gray)
                    .font(.system(size: 10.0))
                    .offset(CGSize(width: 5, height: -18.0))
            }
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    PrimaryTextFieldView(text: .constant(""), textfieldId: .constant(UUID()))
}
