//
//  ProfileFeatures.swift
//  IFoodQuality
//
//  Created by amine maza on 05/04/2024.
//

import Foundation
import SwiftUI

enum ProfileFeatures: CaseIterable, Hashable{
    case myInformation
    
    var title: String {
        switch self {
        case .myInformation :
            return NSLocalizedString("profile.myInformation", comment: "")
        }
    }
    
    var view: some View {
        switch self {
        case .myInformation :
            return MyInformationsView()
        }
    }
}
