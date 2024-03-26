//
//  PrimaryButonViewConfig.swift
//  IFoodQuality
//
//  Created by amine maza on 19/03/2024.
//

import SwiftUI

    struct PrimaryButtonViewConfig : ButtonStyle {
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                        .background(.regularButton)
                        .foregroundColor(.regularFont)
                        .cornerRadius(8.0)
                        .animation(.easeOut (duration: 0.2), value: configuration.isPressed)
        }
    }
