//
//  RestaurantApi.swift
//  IFoodQuality
//
//  Created by amine maza on 16/04/2024.
//

import Foundation

struct RestaurantApi {
    
    private let restaurantPath = "/restaurant"
    
    private let addRestaurantEndpoint = "/create"
    private let fetchOwnedRestaurantEndpoint = "/get-owned-restaurants"
    
    func addRestaurant(restaurantToAddRequest: AddRestaurantRequest) async throws -> Bool {
        guard let addRestaurantUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: addRestaurantEndpoint).url else {
            throw NetworkError.unknown
        }
        
        var request = HttpBuilder.constructRequest(url: addRestaurantUrl, httpMethod: HttpMethod.POST.rawValue)
        
        do {
            request.httpBody = try JSONEncoder().encode(restaurantToAddRequest)
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
    
    func fetchOwnedRestaurant() async throws -> [RestaurantItem] {
        guard let fetchOwnedRestaurantUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: fetchOwnedRestaurantEndpoint).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: fetchOwnedRestaurantUrl, httpMethod: HttpMethod.GET.rawValue)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != HttpResponseCode.SUCCESS.rawValue {
            throw NetworkError.httpStatusCodeNotOK(code: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            return try decoder.decode([RestaurantItem].self
                                      , from: data)
        } catch {
            throw NetworkError.unknown
        }
    }
    
    
}
