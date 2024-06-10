//
//  UserManagementApi.swift
//  IFoodQuality
//
//  Created by amine maza on 01/05/2024.
//

import Foundation

struct UserManagementApi {
    
    private let userPath = "/user"
    
    private let addUserEndpoint = "/create"
    
    func addUser(userToAdd: AddUserRequest) async throws -> Bool {
        guard let addUserUrl = HttpBuilder.constructUrl(path: userPath, endpoint: addUserEndpoint).url else {
            throw NetworkError.unknown
        }
        
        var request = HttpBuilder.constructRequest(url: addUserUrl, httpMethod: HttpMethod.POST.rawValue)
        
        do {
            let encoder = JSONEncoder()
//            encoder.dataEncodingStrategy = JSONEncoder.yyyyMMddJson
            request.httpBody = try encoder.encode(userToAdd)
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
            return try decoder.decode(Bool.self
                                      , from: data)
        } catch {
            throw NetworkError.unknown
        }
    }
    
}
