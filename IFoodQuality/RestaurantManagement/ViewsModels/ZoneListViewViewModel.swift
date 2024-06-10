//
//  ZoneListViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 25/04/2024.
//

import Foundation

class ZoneListViewViewModel: ObservableObject {
    var restaurantId: Int = 0
    @Published var zones: [ZoneItem] = []
    @Published var errorMessage: String?
    
    @Published var isLoading = false
    @Published var isDeleted = false
    
    func fetchZonesByRestaurant() async {
        do {
            await updateIsDeleted(newValue: false)
            await updateIsLoading(newValue: true)
            let zones = try await RestaurantApi().fetchZonesByRestaurant(restaurantId: restaurantId)
            await updateUI(zones)
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    func deleteZone(zoneId: Int) async {
        do {
            let isDeleted = try await RestaurantApi().deleteZone(zoneId: zoneId)
            if (isDeleted) {
                await updateIsDeleted(newValue: isDeleted)
            }
            await fetchZonesByRestaurant()
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    @MainActor
    func updateIsDeleted(newValue: Bool)  {
        isDeleted = newValue
    }
    
    @MainActor
    func updateIsLoading(newValue: Bool) {
        isLoading = newValue
    }
    
    @MainActor
    private func updateUI(_ zones :[ZoneItem]) -> Void {
        updateIsLoading(newValue: false)
        self.zones = zones
        errorMessage = nil
    }
    
    @MainActor
    private func reportError(_ error: String) -> Void {
        updateIsLoading(newValue: false)
        errorMessage = error
        zones = []
    }
    
}
