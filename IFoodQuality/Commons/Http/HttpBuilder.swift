//
//  UrlBuilder.swift
//  IFoodQuality
//
//  Created by amine maza on 07/04/2024.
//

import Foundation

struct HttpBuilder {
    
    private static let scheme = "http"
    private static let host = "localhost"
    private static let port = 8080
    private static let initialPath = "/api/v1"
    
    private static let JSON_TYPE = "application/json"
    private static let AUTHORIZATION_HEADER = "Authorization"
    private static let BEARER = "Bearer "
    
    public static func constructUrl(path: String, endpoint: String, requestParam: [String: String]? = nil) -> URLComponents {
        var queryItems: [URLQueryItem] = []
        if let safeRequestParam = requestParam {
            for (key, value) in safeRequestParam {
                let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                let encodedValue = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                queryItems.append(URLQueryItem(name: encodedKey, value: encodedValue))
            }
        }
        
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.port = port
        urlComponent.path = initialPath + path + endpoint
        if (!queryItems.isEmpty) {
            urlComponent.queryItems = queryItems
        }
        return urlComponent
    }
    
    public static func constructRequest(url: URL, httpMethod: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        
        request.addValue(JSON_TYPE, forHTTPHeaderField: "Content-Type")
        request.addValue(JSON_TYPE, forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults.standard.string(forKey: AppConstant.ACCESS_TOKEN.rawValue) {
            request.addValue(BEARER + token, forHTTPHeaderField: AUTHORIZATION_HEADER)
        }
        
        return request
    }
}
