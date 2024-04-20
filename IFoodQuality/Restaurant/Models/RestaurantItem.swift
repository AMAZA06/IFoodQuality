//
//  RestaurantItem.swift
//  IFoodQuality
//
//  Created by amine maza on 17/04/2024.
//

import Foundation

struct RestaurantItem: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var pictureUri: String?
    var picture: Data?
}
