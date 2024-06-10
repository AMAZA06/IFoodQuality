//
//  SecondaryButtonView.swift
//  IFoodQuality
//
//  Created by amine maza on 24/04/2024.
//

import SwiftUI

struct SecondaryButtonView:  View {
    
    var buttonLabel: () -> Label<Text, Image>
    var action : () -> Void = {}
    var width = Int(UIScreen.main.bounds.width * 0.8)
    var height = 50
    
    var body: some View {
        Button(action: action, label : buttonLabel)
            .buttonStyle(SecondaryButtonConfig(width: width, height: height))
    }
}

#Preview {
    SecondaryButtonView(buttonLabel: {
        Label("Button", systemImage: "")
    })
}
