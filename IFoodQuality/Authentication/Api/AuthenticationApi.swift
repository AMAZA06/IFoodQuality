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
    
    func login(completion: @escaping (LoginResponseData) -> Void, loginRequest: LoginRequest) {
        var urlComponent = constructUrl(endpoint: loginEndpoint)
        guard let url = urlComponent.url else {
            return
        }
        
        var request = constructRequest(url: url, httpMethod: "post")
        
        do {
            request.httpBody = try JSONEncoder().encode(loginRequest)
        } catch {
        }
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                let response = try? JSONDecoder().decode(LoginResponseData.self, from: data)
                
                if let response = response {
                    completion(response)
                } else {
                }
            } else {
                if let error = error {
                }
            }
        }
        task.resume()
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
