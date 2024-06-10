//
//  DateFormatter.swift
//  IFoodQuality
//
//  Created by amine maza on 08/05/2024.
//

import Foundation

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
