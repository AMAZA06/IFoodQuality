//
//  FilterView.swift
//  IFoodQuality
//
//  Created by amine maza on 01/05/2024.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var searchingText: String
    var filterAction: () -> Void
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField(LocalizedStringKey("textfield.search"), text: $searchingText)
                .frame(width: UIScreen.main.bounds.width * 0.5)
            Rectangle()
                .frame(width: 1, height: 20)
            PrimaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.filter"), systemImage: "line.3.horizontal.decrease.circle")
            }, action: filterAction, width: 90, height: 30
            )
        }.frame(maxWidth:UIScreen.main.bounds.width)
    }
}

#Preview {
    FilterView(searchingText: .constant("")) {
        print("filter test")
    }
}
