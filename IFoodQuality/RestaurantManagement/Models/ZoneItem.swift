//
//  ZoneItem.swift
//  IFoodQuality
//
//  Created by amine maza on 25/04/2024.
//

import Foundation

struct ZoneItem: Codable, Identifiable, Hashable {
    var id: Int?
    var name: String
    var description: String?
}
