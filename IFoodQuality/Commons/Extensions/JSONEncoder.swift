//
//  JsonEncoder.swift
//  IFoodQuality
//
//  Created by amine maza on 08/05/2024.
//

import Foundation

extension JSONEncoder.DateEncodingStrategy {
    static var yyyyMMddJson: JSONEncoder.DateEncodingStrategy = {
        .formatted(DateFormatter.yyyyMMdd)
    }()
}
