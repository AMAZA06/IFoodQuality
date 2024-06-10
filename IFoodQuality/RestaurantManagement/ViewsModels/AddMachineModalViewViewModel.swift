//
//  AddMachineModalViewViewModal.swift
//  IFoodQuality
//
//  Created by amine maza on 28/04/2024.
//

import Foundation


class AddMachineModalViewViewModel: ObservableObject {
    
    @Published var label: String = ""
    @Published var reference: String = ""
    @Published var targetZoneId: Int = 0
    
    @Published var errorMessage: String?
    @Published var isMachineAdded: Bool = false
    
    
    func addMachine() async {
        do {
            await updateMachineAddedFlag(newValue: false)
            let isSuccess = try await RestaurantApi()
                .addMachine(machineToAdd: AddMachineRequest(label: label, reference: reference.isEmpty ? nil : reference),
                            targetZoneId: targetZoneId)
            if (isSuccess) {
                await updateUI()
            }
        } catch let error as NetworkError {
            await reportError(error: error.description())
        } catch {
            await reportError(error: error.localizedDescription)
        }
    }
    
    @MainActor
    func reinit() {
        label = ""
        reference = ""
        targetZoneId = 0
    }
    
    
    @MainActor
    func updateMachineAddedFlag(newValue: Bool) {
        isMachineAdded = newValue
    }
    
    @MainActor
    func updateUI() {
        errorMessage = nil
        isMachineAdded = true
    }
    
    @MainActor
    func reportError(error: String) {
        isMachineAdded = false
        errorMessage = error
    }
}
