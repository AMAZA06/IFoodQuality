//
//  RestaurantListView.swift
//  IFoodQuality
//
//  Created by amine maza on 15/04/2024.
//

import SwiftUI

struct RestaurantListView: View {
    
    @StateObject var ownedRestaurantsViewViewModel = RestaurantListViewViewModel()
    
    @StateObject var addRestaurantViewViewModel = AddRestaurantModalViewViewModel()
    
    var body: some View {
        ScrollView {
            if (addRestaurantViewViewModel.isRestaurantAdded) {
                NotificationView(type: .SUCCESS, message: LocalizedStringKey("restaurant.added"))
            }
            if (ownedRestaurantsViewViewModel.isDeleted) {
                NotificationView(type: .SUCCESS, message: LocalizedStringKey("restaurant.deleted"))
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum:ownedRestaurantsViewViewModel.ownedRestaurants.isEmpty ? 300 : 150))], spacing: 40) {
                AddRestaurantButtonView(addRestaurantViewViewModel: addRestaurantViewViewModel).onChange(of:
                    addRestaurantViewViewModel.isRestaurantAdded
                ) {
                    Task {
                        await ownedRestaurantsViewViewModel.getOwnedRestaurant()
                        addRestaurantViewViewModel.reinit()
                    }
                }
                
                if (ownedRestaurantsViewViewModel.isLoading) {
                    LoadingView()
                }
                
                if (!ownedRestaurantsViewViewModel.ownedRestaurants.isEmpty) {
                    ForEach(ownedRestaurantsViewViewModel.ownedRestaurants) { ownedRestaurant in
                        NavigationLink(value: ownedRestaurant) {
                            RestaurantItemView(name: ownedRestaurant.name, 
                                               pictureUri: ownedRestaurant.pictureUri, deleteAction: {
                                Task {
                                    await ownedRestaurantsViewViewModel.deleteRestaurant(restaurantId:ownedRestaurant.id)
                                }
                            })
                        }
                    }
                    
                } else {
                    Spacer()
                    Text(LocalizedStringKey("restaurant.norestaurant"))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
            }
        }.scrollIndicators(.visible)
        .navigationDestination(for: RestaurantItem.self) { ownedRestaurant in
            RestaurantView(restaurantId: ownedRestaurant.id,
                           pictureUri: ownedRestaurant.pictureUri)
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
