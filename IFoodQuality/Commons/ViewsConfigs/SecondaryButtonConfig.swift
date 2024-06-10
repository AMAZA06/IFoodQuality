//
//  SecondaryButtonConfig.swift
//  IFoodQuality
//
//  Created by amine maza on 24/04/2024.
//

import SwiftUI

struct SecondaryButtonConfig : ButtonStyle {
    
    var width: Int
    var height: Int
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.regularFont)
            .frame(width: CGFloat(width), height: CGFloat(height))
            .overlay {
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(.regularButton)
                    .foregroundColor(.clear)
            }
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut (duration: 0.2), value: configuration.isPressed)
            .contentShape(RoundedRectangle(cornerRadius: 8.0))
    }
}
