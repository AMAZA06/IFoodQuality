//
//  AddRestaurantView.swift
//  IFoodQuality
//
//  Created by amine maza on 15/04/2024.
//

import SwiftUI

struct AddRestaurantButtonView: View {
    
    @State private var showingSheet = false
    @ObservedObject var addRestaurantViewViewModel: AddRestaurantModalViewViewModel
    
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
            AddRestaurantModalView(addRestaurantViewViewModel: addRestaurantViewViewModel, showingSheet: $showingSheet)
        }
        .frame(width: 120, height: 120)
            .background(Color(uiColor: .panel))
            .cornerRadius(6.0)
    }
}


#Preview {
    AddRestaurantButtonView(addRestaurantViewViewModel: AddRestaurantModalViewViewModel())
}
