//
//  FeaturesViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 04/04/2024.
//

import Foundation
import SwiftUI

enum Features: CaseIterable, Hashable {
    case restaurant
    case users
    
    var title: String {
        switch self {
            case .restaurant :
                return NSLocalizedString("features.restaurants", comment: "")
            case .users :
                return NSLocalizedString("features.users", comment: "")
        }
    }
    
    var icon: String {
        switch self {
            case .restaurant:
                return "house"
            case .users:
                return "person"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
            case .restaurant:
                RestaurantsView()
            case .users:
                UsersView()
        }
    }
    
    
}
