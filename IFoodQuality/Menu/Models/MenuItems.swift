//
//  MenuItem.swift
//  IFoodQuality
//
//  Created by amine maza on 03/04/2024.
//

import Foundation

enum MenuItems: Int, CaseIterable {
    case home = 0
    case features
    case profile
    
    var title: String {
        switch self {
        case .home :
            return NSLocalizedString("menu.home", comment: "")
        case .features :
            return NSLocalizedString("menu.features", comment: "")
        case .profile :
            return NSLocalizedString("menu.profile", comment: "")
        }
    }
    
    var icon: String {
        switch self {
            case .home :
                return "house"
            case .features :
                return "circle.grid.2x2"
            case .profile :
                return "person.fill"
        }
    }
}
