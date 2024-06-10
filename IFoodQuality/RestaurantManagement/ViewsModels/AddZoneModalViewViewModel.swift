//
//  AddZoneModalViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 24/04/2024.
//

import Foundation

class AddZoneModalViewViewModel : ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    var restaurantId: Int = 0
    
    @Published var isZoneAdded: Bool = false
    @Published var errorMessage: String?
    
    func addZone() async {
        do {
            await updateZoneAddedFlag(newValue: false)
            let isSuccess = try await RestaurantApi().addZone(zoneToAdd: AddZoneRequest(name: name, description: description.isEmpty ? nil : description), targetRestaurantId: restaurantId)
            
            if (isSuccess) {
                await updateUI()
            }
        } catch let error as NetworkError{
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    @MainActor
    func updateZoneAddedFlag(newValue: Bool) {
        isZoneAdded = newValue
    }
    
    @MainActor
    func reinit() {
        name = ""
        description = ""
    }
    
    @MainActor
    private func updateUI() {
        isZoneAdded = true
        errorMessage = nil
    }
    
    @MainActor
    private func reportError(_ error: String) {
        errorMessage = error
        isZoneAdded = false
    }
}
