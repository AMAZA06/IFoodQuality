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
    private let fetchRestaurantDetailEndpoint = "/get-restaurant-details"
    
    private let addZoneEndpoint = "/add-zone"
    private let getZonesByRestaurantEndpoint = "/get-zones-by-restaurant"
    
    private let addMachineEndpoint = "/add-machine"
    private let getMachinesByRestaurantEndpoint = "/get-machines-by-restaurant"
    
    private let deleteRestaurantEndPoint = "/delete-restaurant"
    private let deleteMachineEndpoint = "/delete-machine"
    private let deleteZoneEndpoint = "/delete-zone"
    
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
    
    func fetchRestaurantDetails(id: Int) async throws -> RestaurantDetails {
        let queryItem: [String: String] = ["id": id.description]
        
        guard let fetchRestaurantDetail = HttpBuilder.constructUrl(path: restaurantPath, endpoint: fetchRestaurantDetailEndpoint, requestParam: queryItem).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: fetchRestaurantDetail, httpMethod: HttpMethod.GET.rawValue)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != HttpResponseCode.SUCCESS.rawValue {
            throw NetworkError.httpStatusCodeNotOK(code: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            return try decoder.decode(RestaurantDetails.self
                                      , from: data)
        } catch {
            throw NetworkError.unknown
        }
    }
    
    
    func addZone(zoneToAdd: AddZoneRequest, targetRestaurantId: Int) async throws -> Bool {
        
        let queryItem: [String: String] = ["restaurantId": String(targetRestaurantId)]
        
        guard let addZoneUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: addZoneEndpoint, requestParam: queryItem).url else {
            throw NetworkError.unknown
        }
        
        var request = HttpBuilder.constructRequest(url: addZoneUrl, httpMethod: HttpMethod.POST.rawValue)
        
        do {
            request.httpBody = try JSONEncoder().encode(zoneToAdd)
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
    
    func fetchZonesByRestaurant(restaurantId: Int) async throws -> [ZoneItem] {
        let queryItem: [String: String] = ["restaurantId": String(restaurantId)]
        
        guard let fetchZoneByRestaurantUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: getZonesByRestaurantEndpoint, requestParam: queryItem).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: fetchZoneByRestaurantUrl, httpMethod: HttpMethod.GET.rawValue)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != HttpResponseCode.SUCCESS.rawValue {
            throw NetworkError.httpStatusCodeNotOK(code: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            return try decoder.decode([ZoneItem].self
                                      , from: data)
        } catch {
            throw NetworkError.unknown
        }
    }
    
    func addMachine(machineToAdd: AddMachineRequest, targetZoneId: Int) async throws -> Bool{
        
        let queryItem: [String: String] = ["targetZoneId": String(targetZoneId)]
        
        guard let addMachineUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: addMachineEndpoint, requestParam: queryItem).url
        else {
            throw NetworkError.unknown
        }
        
        var request = HttpBuilder.constructRequest(url: addMachineUrl, httpMethod: HttpMethod.POST.rawValue)
        
        do {
            request.httpBody = try JSONEncoder().encode(machineToAdd)
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
    
    func fetchMachinesByRestaurant(restaurantId: Int) async throws -> [MachineItem] {
        let queryItem: [String: String] = ["restaurantId": String(restaurantId)]
        
        guard let fetchMachinesByRestaurantUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: getMachinesByRestaurantEndpoint, requestParam: queryItem).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: fetchMachinesByRestaurantUrl, httpMethod: HttpMethod.GET.rawValue)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != HttpResponseCode.SUCCESS.rawValue {
            throw NetworkError.httpStatusCodeNotOK(code: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            return try decoder.decode([MachineItem].self
                                      , from: data)
        } catch {
            throw NetworkError.unknown
        }
    }
    
    func deleteRestaurant(restaurantId: Int) async throws -> Bool {
        let queryItem: [String: String] = ["restaurantId": String(restaurantId)]
        
        guard let deleteRestaurantUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: deleteRestaurantEndPoint, requestParam: queryItem).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: deleteRestaurantUrl, httpMethod: HttpMethod.DELETE.rawValue)
        
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
    
    func deleteZone(zoneId: Int) async throws -> Bool {
        let queryItem: [String: String] = ["zoneId": String(zoneId)]
        
        guard let deleteZoneUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: deleteZoneEndpoint, requestParam: queryItem).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: deleteZoneUrl, httpMethod: HttpMethod.DELETE.rawValue)
        
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
    
    func deleteMachine(machineId: Int) async throws -> Bool {
        let queryItem: [String: String] = ["machineId": String(machineId)]
        
        guard let deleteMachineUrl = HttpBuilder.constructUrl(path: restaurantPath, endpoint: deleteMachineEndpoint, requestParam: queryItem).url else {
            throw NetworkError.unknown
        }
        
        let request = HttpBuilder.constructRequest(url: deleteMachineUrl, httpMethod: HttpMethod.DELETE.rawValue)
        
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
