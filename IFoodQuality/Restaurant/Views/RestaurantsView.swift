//
//  RestaurantView.swift
//  IFoodQuality
//
//  Created by amine maza on 04/04/2024.
//

import SwiftUI

struct RestaurantsView: View {
    
    @State var restaurantSearch: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Image(systemName: "magnifyingglass")
                TextField(LocalizedStringKey("textfield.search"), text: $restaurantSearch)
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                Rectangle()
                    .frame(width: 1, height: 20)
                PrimaryButtonView(buttonLabel: {
                    Label(LocalizedStringKey("button.filter"), systemImage: "line.3.horizontal.decrease.circle")
                    }, action: {
                        print("text")
                    }, width: 90, height: 30
                )
            }.frame(maxWidth:UIScreen.main.bounds.width)
            RestaurantListView()
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .padding(.top, 40)
        }
        .background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .topLeading, endPoint: .bottom)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    RestaurantsView()
}
