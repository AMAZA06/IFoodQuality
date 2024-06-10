//
//  RestaurantViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import Foundation

class RestaurantViewViewModel: ObservableObject {
    
    @Published var id: Int?
    @Published var pictureUri: String = ""
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var contactNumber: String = ""
    @Published var contactMail: String = ""
    @Published var description: String = ""
    
    @Published var errorMessage: String?
    
    func fetchRestaurantDetails() async {
        do {
            let restaurantDetails = try await RestaurantApi().fetchRestaurantDetails(id: id!)
            await updateUI(restaurantDetails: restaurantDetails)
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    @MainActor
    private func updateUI(restaurantDetails: RestaurantDetails) {
        id = restaurantDetails.id
        pictureUri = restaurantDetails.pictureUri ?? ""
        name = restaurantDetails.name
        location = restaurantDetails.location
        contactNumber = restaurantDetails.contactNumber
        contactMail = restaurantDetails.contactMail
        description = restaurantDetails.description ?? ""
        
        errorMessage = nil
    }
    
    @MainActor
    private func reportError(_ error: String) {
        errorMessage = error
    }
}
