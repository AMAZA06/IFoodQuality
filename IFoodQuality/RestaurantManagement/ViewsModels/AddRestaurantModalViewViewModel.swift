//
//  AddRestaurantViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 16/04/2024.
//

import Foundation

class AddRestaurantModalViewViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var contactNumber: String = ""
    @Published var contactMail: String = ""
    @Published var description: String = ""
    @Published var image: Data?
    var imagePath: String?
    
    @Published var isRestaurantAdded: Bool = false
    @Published var errorMessage: String?
    
    @Published var isLoading = false
    
    let RESTAURANT_PATH = "restaurant/"
    let JPG_FORMAT = ".jpg"
    
    func addRestaurant() async {
        do {
            await updateIsLoading(newValue: true)
            await updateIsRestaurantAdded(newValue: false)
            if (image != nil) {
                imagePath = "\(RESTAURANT_PATH)\(UUID().uuidString)\(JPG_FORMAT)"
                
                _ = try await FirestoreService.uploadFile(data: image, filename: imagePath!)
            }
            let isRestaurantAdded = try await RestaurantApi().addRestaurant(restaurantToAddRequest: AddRestaurantRequest(
                name: name, location: location, contactNumber: contactNumber, contactMail: contactMail, pictureUri: self.imagePath != nil ? self.imagePath! : nil
                )
            )
            if(isRestaurantAdded) {
                await updateUI(isRestaurantAdded: isRestaurantAdded)
            }
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    @MainActor
    func updateIsRestaurantAdded(newValue: Bool) {
        isRestaurantAdded = newValue
    }
    
    @MainActor
    func updateIsLoading(newValue: Bool) {
        isLoading = newValue
    }
    
    @MainActor
    func reinit() {
        name = ""
        location = ""
        contactNumber = ""
        contactMail = ""
        description = ""
        image = nil
        imagePath = nil
        errorMessage = nil
    }
    
    @MainActor
    private func updateUI(isRestaurantAdded: Bool) {
        updateIsLoading(newValue: false)
        self.isRestaurantAdded = isRestaurantAdded
        errorMessage = nil
    }
    
    @MainActor
    private func reportError(_ error: String) {
        updateIsLoading(newValue: false)
        self.isRestaurantAdded = false
        errorMessage = error
    }
}
