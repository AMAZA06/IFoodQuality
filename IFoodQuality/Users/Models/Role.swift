//
//  Role.swift
//  IFoodQuality
//
//  Created by amine maza on 04/05/2024.
//

import Foundation

enum Role : Int, Codable, Hashable, CaseIterable, CustomStringConvertible {
    case ADMIN = 1
    case MANAGER = 2
    case WORKER = 3
    case CONTRACTOR = 4
    
    var description : String {
        switch self {
            case .ADMIN: "ADMIN"
            case .MANAGER: "MANAGER"
            case .WORKER: "WORKER"
            case .CONTRACTOR: "CONTRACTOR"
        }
    }
}
