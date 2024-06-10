//
//  MachineItemView.swift
//  IFoodQuality
//
//  Created by amine maza on 29/04/2024.
//

import SwiftUI

struct MachineItemView: View {
    
    let label: String
    let reference: String?
    
    let deleteAction: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(6.0)
                .foregroundColor(Color(uiColor: .panel))
            
            DeleteButtonView(action: deleteAction)
            VStack {
                
                Text(label)
                    .padding(.bottom, 5)
                Rectangle().frame(width: 50, height: 1)
                if let reference = reference {
                    Text(reference)
                        .multilineTextAlignment(.center)
                }
            }
        }.frame(width: 170, height: 90)
    }
}

#Preview {
    MachineItemView(label: "Fridge", reference: "07Z3E4947794", deleteAction: {})
}
