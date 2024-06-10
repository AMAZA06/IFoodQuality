//
//  ErrorPanelView.swift
//  IFoodQuality
//
//  Created by amine maza on 08/05/2024.
//

import SwiftUI

struct ErrorPanelView: View {
    
    @Binding var error: String?
    
    var body: some View {
        if (error != nil) {
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(.error)
                .overlay {
                    Text(error!)
                        .padding(.horizontal, 10)
                        .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 55)
                .padding(.top, 20)
        }
    }
}

#Preview {
    ErrorPanelView(error: .constant("Error message"))
}
