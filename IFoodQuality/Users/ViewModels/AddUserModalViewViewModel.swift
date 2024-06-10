//
//  AddUserModalViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 01/05/2024.
//

import Foundation

class AddUserModalViewViewModel: ObservableObject {
    
    @Published var fullname: String = ""
    @Published var mail: String = ""
    @Published var phoneNumber: String = ""
    @Published var endingDate: Date?
    @Published var startingDate: Date = Date()
    @Published var workingOnRestaurantId: Int = 0
    @Published var roleId: Int = Role.WORKER.rawValue
    
    @Published var errorMessage: String?
    @Published var isUserAdded: Bool = false
    @Published var isLoading: Bool = false
    
    func addUser() async {
        do {
            await updateIsLoading(newValue: true)
            let isAdded = try await UserManagementApi().addUser(userToAdd: AddUserRequest(fullname: fullname, mail: mail, phoneNumber: phoneNumber, endingDate: endingDate != nil ? endingDate?.description : nil, startingDate: startingDate.description, workingOnRestaurantId: workingOnRestaurantId, role: Role.init(rawValue: roleId)?.description ?? Role.WORKER.description))
            
            if (isAdded) {
                await updateUI()
            }
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    @MainActor
    func updateIsLoading(newValue: Bool) {
        isLoading = newValue
    }
    
    @MainActor
    func reinit() {
        fullname = ""
        mail = ""
        phoneNumber = ""
        endingDate = Date.distantFuture
        startingDate = Date()
        workingOnRestaurantId = 0
        roleId = Role.WORKER.rawValue
    }
    
    @MainActor
    func updateUI() {
        updateIsLoading(newValue: false)
        errorMessage = nil
        isUserAdded = true
        reinit()
    }
    
    @MainActor
    func reportError(_ error: String) {
        updateIsLoading(newValue: false)
        errorMessage = error
        isUserAdded = false
    }
    
}
