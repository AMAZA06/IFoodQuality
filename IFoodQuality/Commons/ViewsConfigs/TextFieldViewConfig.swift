//
//  TextFieldViewConfig.swift
//  IFoodQuality
//
//  Created by amine maza on 16/04/2024.
//

import Foundation
import SwiftUI

struct TextFieldViewConfig : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
