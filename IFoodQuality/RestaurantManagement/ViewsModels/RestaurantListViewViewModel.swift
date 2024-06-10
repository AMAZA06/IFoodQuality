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
    
    @Published var isLoading = false
    @Published var isDeleted = false
    
    
    func getOwnedRestaurant() async {
        do {
            await updateIsLoading(newValue: true)
            await updateIsDeleted(newValue: false)
            let ownedRestaurants = try await RestaurantApi().fetchOwnedRestaurant()
            await updateUI(ownedRestaurants)
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    func deleteRestaurant(restaurantId: Int) async {
        do {
            let isDeleted = try await RestaurantApi().deleteRestaurant(restaurantId: restaurantId)
            if (isDeleted) {
                await updateIsDeleted(newValue: isDeleted)
            }
            await getOwnedRestaurant()
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    @MainActor
    func updateIsDeleted(newValue: Bool) {
        isDeleted = newValue
    }
    
    @MainActor
    func updateIsLoading(newValue: Bool) {
        isLoading = newValue
    }
    
    @MainActor
    private func updateUI(_ ownedRestaurants :[RestaurantItem]) -> Void {
        updateIsLoading(newValue: false)
        self.ownedRestaurants = ownedRestaurants
        errorMessage = nil
    }
    
    @MainActor
    private func reportError(_ error: String) -> Void {
        updateIsLoading(newValue: false)
        errorMessage = error
        ownedRestaurants = []
    }
}
