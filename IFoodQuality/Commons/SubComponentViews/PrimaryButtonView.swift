//
//  PrimaryButtonView.swift
//  IFoodQuality
//
//  Created by amine maza on 19/03/2024.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    var buttonWidth = 0.0
    var buttonHeight = 0.0
    var buttonLabel = ""
    var action : () -> Void = {}
    
    
    var body: some View {
        Button(action: action, label : {
            Text(buttonLabel)
                .frame(width: buttonWidth, height: buttonHeight)
        })
        .buttonStyle(PrimaryButtonViewConfig())
    
    }
}

#Preview {
    PrimaryButtonView()
}
