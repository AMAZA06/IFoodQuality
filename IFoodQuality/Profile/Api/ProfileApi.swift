//
//  ProfileApi.swift
//  IFoodQuality
//
//  Created by amine maza on 07/04/2024.
//

import Foundation


struct ProfileApi {

        let userPath = "/user"
        let endpoint = "/my-profile"

    func fetchMyProfile() async throws -> MyProfileData {
        
        guard let myProfileUrl = HttpBuilder.constructUrl(path: userPath, endpoint: endpoint).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: myProfileUrl, httpMethod: HttpMethod.GET.rawValue)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != HttpResponseCode.SUCCESS.rawValue {
            throw NetworkError.httpStatusCodeNotOK(code: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            return try decoder.decode(MyProfileData.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
