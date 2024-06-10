//
//  MachineItem.swift
//  IFoodQuality
//
//  Created by amine maza on 29/04/2024.
//

import Foundation

struct MachineItem: Codable, Identifiable {
    var id: Int
    var label: String
    var reference: String?
}
