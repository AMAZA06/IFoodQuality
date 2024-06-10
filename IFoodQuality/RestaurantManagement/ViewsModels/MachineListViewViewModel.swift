//
//  MachineListViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 29/04/2024.
//

import Foundation

class MachineListViewViewModel: ObservableObject {
    
    var restaurantId: Int = 0
    @Published var machines: [MachineItem] = []
    @Published var errorMessage: String?
    
    @Published var isLoading = false
    @Published var isDeleted = false
    
    func fetchMachinesByRestaurant() async {
        do {
            await updateIsDeleted(newValue: false)
            await updateIsLoading(newValue: true)
            let machines = try await RestaurantApi().fetchMachinesByRestaurant(restaurantId: restaurantId)
            await updateUI(machines)
        } catch let error as NetworkError {
            await reportError(error: error.description())
        } catch {
            await reportError(error: error.localizedDescription)
        }
    }
    
    func deleteMachine(machineId: Int) async {
        do {
            let isDeleted = try await RestaurantApi().deleteMachine(machineId: machineId)
            if (isDeleted) {
                await updateIsDeleted(newValue: isDeleted)
            }
            await fetchMachinesByRestaurant()
        } catch let error as NetworkError {
            await reportError(error: error.description())
        } catch {
            await reportError(error: error.localizedDescription)
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
    func updateUI(_ machines: [MachineItem]) {
        updateIsLoading(newValue: false)
        self.machines = machines
        errorMessage = nil
    }
    
    @MainActor
    func reportError(error: String) {
        updateIsLoading(newValue: false)
        errorMessage = error
    }
}
