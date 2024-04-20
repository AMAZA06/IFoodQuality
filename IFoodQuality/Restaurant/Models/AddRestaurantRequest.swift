//
//  AddRestaurantRequest.swift
//  IFoodQuality
//
//  Created by amine maza on 16/04/2024.
//

import Foundation

struct AddRestaurantRequest: Encodable {
    var name: String
    var location: String
    var contactNumber: String
    var contactMail: String
    var description: String?
    var pictureUri: String?
}
