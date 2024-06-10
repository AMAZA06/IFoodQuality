//
//  PrimaryButtonView.swift
//  IFoodQuality
//
//  Created by amine maza on 19/03/2024.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    var buttonLabel: () -> Label<Text, Image>
    var action : () -> Void = {}
    var width = Int(UIScreen.main.bounds.width * 0.8)
    var height = 50
    
    var body: some View {
        Button(action: action, label : buttonLabel)
        .buttonStyle(PrimaryButtonViewConfig(width: width, height: height))
    }
}

#Preview {
    PrimaryButtonView(buttonLabel: {
        Label("Button", systemImage: "")
    })
}
