//
//  ZoneItemView.swift
//  IFoodQuality
//
//  Created by amine maza on 24/04/2024.
//

import SwiftUI

struct ZoneItemView: View {
    
    var name: String
    var description: String?
    
    var deleteAction: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(6.0)
                .foregroundColor(Color(uiColor: .panel))
            DeleteButtonView(action: deleteAction)
            VStack {
                Text(name)
                    .padding(.bottom, 5)
                Rectangle().frame(width: 50, height: 1)
                if let description = description {
                    Text(description)
                        .multilineTextAlignment(.center)
                }
            }
        }.frame(width: 170, height: 90)
    }
}

#Preview {
    ZoneItemView(name: "Example", description: "", deleteAction: {})
}
