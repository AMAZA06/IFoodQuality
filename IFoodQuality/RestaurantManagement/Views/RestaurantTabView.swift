//
//  RestaurantTabView.swift
//  IFoodQuality
//
//  Created by amine maza on 21/04/2024.
//

import SwiftUI

struct RestaurantTabView: View {
    
    var restaurantId: Int
    @State var selectedTab: RestaurantTab = RestaurantTab.tabRestaurant
    @StateObject var zoneListViewModel = ZoneListViewViewModel()
    
    var body: some View {
        
        VStack{
            HStack {
                ForEach(RestaurantTab.allCases, id: \.self) { tab in
                    VStack {
                        Button(tab.title) {
                            selectedTab = tab
                        }.foregroundColor(.white)
                            .padding(.horizontal, 20)
                        if selectedTab == tab {
                            Rectangle()
                                .frame(width: 70, height: 1)
                        }
                    }
                    
                }
            }.padding(.vertical, 20)
            
            selectedTab.view(restaurantId: restaurantId, zoneListViewModel: zoneListViewModel)
                .frame(maxHeight: UIScreen.main.bounds.height * 0.5)
        }.onAppear {
            Task {
                zoneListViewModel.restaurantId = restaurantId
                await zoneListViewModel.fetchZonesByRestaurant()
            }
        }
        
    }
}

#Preview {
    RestaurantTabView(restaurantId: 0)
}
