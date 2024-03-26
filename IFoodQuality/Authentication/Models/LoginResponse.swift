//
//  LoginResponse.swift
//  IFoodQuality
//
//  Created by amine maza on 26/03/2024.
//

import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let access_token: String
    let refresh_token: String
}
