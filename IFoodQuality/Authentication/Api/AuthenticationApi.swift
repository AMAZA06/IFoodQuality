//
//  Authentication.swift
//  IFoodQuality
//
//  Created by amine maza on 23/03/2024.
//

import Foundation

struct AuthenticationApi {
    
    let authPath = "/auth"
    
    let loginEndpoint = "/authenticate"
    
    func login(loginRequest: LoginRequest) async throws -> LoginResponseData {
        guard let authenticationUrl = HttpBuilder.constructUrl(path: authPath, endpoint: loginEndpoint).url else {
            throw NetworkError.unknown
        }
        
        var request = HttpBuilder.constructRequest(url: authenticationUrl, httpMethod: HttpMethod.POST.rawValue)
        
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
}
