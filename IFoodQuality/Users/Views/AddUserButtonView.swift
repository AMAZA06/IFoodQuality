//
//  AddUserButtonView.swift
//  IFoodQuality
//
//  Created by amine maza on 01/05/2024.
//

import SwiftUI

struct AddUserButtonView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button(action :  {
            showingSheet.toggle()
        }, label: {
            Label("", systemImage: "plus")
                .font(.system(size: 36))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.regularFont)
                .contentShape(Rectangle())
        }).sheet(isPresented: $showingSheet) {
            AddUserModalView(showingSheet: $showingSheet)
        }
        .frame(width: 120, height: 120)
        .background(Color(uiColor: .panel))
        .cornerRadius(6.0)
    }
}

#Preview {
    AddUserButtonView()
}
