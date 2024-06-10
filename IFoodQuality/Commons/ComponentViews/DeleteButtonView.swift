//
//  DeleteButtonView.swift
//  IFoodQuality
//
//  Created by amine maza on 30/04/2024.
//

import SwiftUI

struct DeleteButtonView: View {
    
    var offsetWidth: Double = 60.0
    var offsetHeight: Double = -30.0
    var action : () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Circle()
                .foregroundColor(.removeButton)
                .frame(width: 20, height: 20)
                .overlay(
                    Rectangle()
                        .frame(width: 10, height: 3)
                )
        })
        .foregroundColor(.white)
        .offset(CGSize(width: offsetWidth, height: offsetHeight))
    }
}

#Preview {
    DeleteButtonView(action: {
            print("test")
    })
}
