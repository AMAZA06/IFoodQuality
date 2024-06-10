//
//  AddUserRequest.swift
//  IFoodQuality
//
//  Created by amine maza on 01/05/2024.
//

import Foundation

struct AddUserRequest: Codable {
    var fullname: String
    var mail: String
    var phoneNumber: String
    var endingDate: String?
    var startingDate: String
    var workingOnRestaurantId: Int
    var role: String
}
