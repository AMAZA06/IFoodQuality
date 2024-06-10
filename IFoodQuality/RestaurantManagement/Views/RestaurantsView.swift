//
//  RestaurantView.swift
//  IFoodQuality
//
//  Created by amine maza on 04/04/2024.
//

import SwiftUI

struct RestaurantsView: View {
    
    @State var restaurantSearchKeyword: String = ""
    var filterAction = {}
    
    var body: some View {
        VStack {
            Spacer()
            FilterView(searchingText: $restaurantSearchKeyword, filterAction: filterAction)
            RestaurantListView()
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .padding(.top, 40)
        }
        .background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    RestaurantsView()
}
