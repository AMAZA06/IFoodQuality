//
//  RestaurantDetails.swift
//  IFoodQuality
//
//  Created by amine maza on 21/04/2024.
//

import Foundation

struct RestaurantDetails: Codable {

    var id: Int
    var name: String
    var contactMail: String
    var contactNumber: String
    var location: String
    var description: String?
    var pictureUri: String?
    
}
