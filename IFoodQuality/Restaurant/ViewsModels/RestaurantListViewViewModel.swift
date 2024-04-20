//
//  RestaurantListViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 17/04/2024.
//

import Foundation

class RestaurantListViewViewModel: ObservableObject {
    
    @Published var ownedRestaurants: [RestaurantItem] = []
    @Published var errorMessage: String?
    
    func getOwnedRestaurant() async {
        do {
            let ownedRestaurants = try await RestaurantApi().fetchOwnedRestaurant()
            await updateUI(ownedRestaurants)
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    
    @MainActor
    func updateUI(_ ownedRestaurants :[RestaurantItem]) -> Void {
        self.ownedRestaurants = ownedRestaurants
        errorMessage = nil
    }
    
    @MainActor
    func reportError(_ error: String) -> Void {
        errorMessage = error
        ownedRestaurants = []
    }
}
