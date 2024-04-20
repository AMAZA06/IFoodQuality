//
//  PrimaryButonViewConfig.swift
//  IFoodQuality
//
//  Created by amine maza on 19/03/2024.
//

import SwiftUI

struct PrimaryButtonViewConfig : ButtonStyle {
    
    var width: Int
    var height: Int
        
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .frame(width: CGFloat(width), height: CGFloat(height))
                .background(.regularButton)
                .foregroundColor(.regularFont)
                .cornerRadius(8.0)
                .animation(.easeOut (duration: 0.2), value: configuration.isPressed)
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        }
}
