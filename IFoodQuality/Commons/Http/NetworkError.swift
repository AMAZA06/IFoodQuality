//
//  NetworkError.swift
//  IFoodQuality
//
//  Created by amine maza on 28/03/2024.
//

import Foundation

enum NetworkError: Error {
    case httpStatusCodeNotOK(code: Int)
    case responseDataNil
    case unknown
    
    func description() -> String {
        
        if case .httpStatusCodeNotOK(let code) = self {
            if (code == HttpResponseCode.UNAURHORIZED.rawValue) {
                return NSLocalizedString("error.api.unauthorized", comment: "")
            }
            if (code == HttpResponseCode.UNAUTHENTICATED.rawValue) {
                return NSLocalizedString("error.api.unauthenticated", comment: "")
            }
            if (code == HttpResponseCode.BAD_REQUEST.rawValue){
                return NSLocalizedString("error.bad-request", comment: "")
            }
        } else {
            switch self {
            case .responseDataNil:
                return NSLocalizedString("error.response.nil", comment: "")
            case .unknown:
                return NSLocalizedString("error.occured", comment: "")
            default:
                return NSLocalizedString("error.occured", comment: "")
            }
        }
        
        return NSLocalizedString("error.occured", comment:"")
    }
}
