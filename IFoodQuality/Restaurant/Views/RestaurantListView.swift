//
//  RestaurantListView.swift
//  IFoodQuality
//
//  Created by amine maza on 15/04/2024.
//

import SwiftUI

struct RestaurantListView: View {
    
    @StateObject var ownedRestaurantsViewViewModel = RestaurantListViewViewModel()
    
    @StateObject var addRestaurantViewViewModel = AddRestaurantViewViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:ownedRestaurantsViewViewModel.ownedRestaurants.isEmpty ? 300 : 150))], spacing: 40) {
                AddRestaurantButtonView(addRestaurantViewViewModel: addRestaurantViewViewModel).onChange(of:
                    addRestaurantViewViewModel.isRestaurantAdded
                ) {
                    Task {
                        await ownedRestaurantsViewViewModel.getOwnedRestaurant()
                    }
                }
                if (!ownedRestaurantsViewViewModel.ownedRestaurants.isEmpty) {
                    ForEach(ownedRestaurantsViewViewModel.ownedRestaurants) { ownedRestaurant in
                        NavigationLink(value: ownedRestaurant) {
                            RestaurantItemView(name: ownedRestaurant.name, pictureUri: ownedRestaurant.pictureUri)
                        }
                    }
                } else {
                    Spacer()
                    Text(LocalizedStringKey("textfield.restaurant.norestaurant"))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
            }
        }.scrollIndicators(.visible)
        .navigationDestination(for: RestaurantItem.self) { ownedRestaurant in
            Text("test")
        }.onAppear {
            Task {
                await ownedRestaurantsViewViewModel.getOwnedRestaurant()
            }
        }
    }
}

#Preview {
    RestaurantListView()
}
