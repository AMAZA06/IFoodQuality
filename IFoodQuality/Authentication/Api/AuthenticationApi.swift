//
//  Authentication.swift
//  IFoodQuality
//
//  Created by amine maza on 23/03/2024.
//

import Foundation

struct AuthenticationApi {
    
    let scheme = "http"
    let host = "localhost"
    let port = 8080
    let initialPath = "/api/v1"
    let authPath = "/auth"
    
    let loginEndpoint = "/authenticate"
    
    func login(loginRequest: LoginRequest) async throws -> LoginResponseData {
        let urlComponent = constructUrl(endpoint: loginEndpoint)
        guard let url = urlComponent.url else {
            throw NetworkError.unknown
        }
        
        var request = constructRequest(url: url, httpMethod: "post")
        
        do {
            request.httpBody = try JSONEncoder().encode(loginRequest)
        } catch {
            throw NetworkError.unknown
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != HttpResponseCode.SUCCESS.rawValue {
                throw NetworkError.httpStatusCodeNotOK(code: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            return try decoder.decode(LoginResponseData.self
                                      , from: data)
        } catch {
            throw NetworkError.unknown
        }
    }
    
    
    private func constructUrl(endpoint: String) -> URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.port = port
        urlComponent.path = initialPath + authPath + endpoint
        
        return urlComponent
    }
    
    private func constructRequest(url: URL, httpMethod: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
}
