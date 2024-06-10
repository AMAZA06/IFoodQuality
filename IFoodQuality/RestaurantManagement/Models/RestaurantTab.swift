//
//  RestaurantTab.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import Foundation
import SwiftUI

enum RestaurantTab : CaseIterable, Hashable {

    case tabRestaurant
    case tabZone
    case tabMachine
    
    var title: String {
        switch self {
            case .tabRestaurant:
                return NSLocalizedString("restaurant.tab.restaurant", comment: "")
            case .tabZone:
                return NSLocalizedString("restaurant.tab.zones", comment: "")
            case .tabMachine:
                return NSLocalizedString("restaurant.tab.machines", comment: "")
        }
    }
    
    @ViewBuilder func view(restaurantId: Int, zoneListViewModel : ZoneListViewViewModel) -> some View {
        switch self {
            case .tabRestaurant:
                RestaurantDetailsView(restaurantId: restaurantId)
            case .tabZone:
                ZonesView(restaurantId: restaurantId, zoneListViewModel: zoneListViewModel)
            case .tabMachine:
                MachinesView(restaurantId: restaurantId, zoneListViewModel: zoneListViewModel)
        }
    }
    
}
