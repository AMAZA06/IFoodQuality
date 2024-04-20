//
//  AddRestaurantViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 16/04/2024.
//

import Foundation

class AddRestaurantViewViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var contactNumber: String = ""
    @Published var contactMail: String = ""
    @Published var description: String = ""
    @Published var image: Data?
    var imagePath: String?
    
    @Published var isRestaurantAdded: Bool = false
    @Published var errorMessage: String?
    
    let RESTAURANT_PATH = "restaurant/"
    let JPG_FORMAT = ".jpg"
    
    func addRestaurant() async {
        do {
            if (image != nil) {
                imagePath = "\(RESTAURANT_PATH)\(UUID().uuidString)\(JPG_FORMAT)"
                
                try await FirestoreService.uploadFile(data: image, filename: imagePath!)
            }
            
            let isRestaurantAdded = try await RestaurantApi().addRestaurant(restaurantToAddRequest: AddRestaurantRequest(
                name: name, location: location, contactNumber: contactNumber, contactMail: contactMail, pictureUri: self.imagePath != nil ? self.imagePath! : nil
                )
            )
            await updateUI(isRestaurantAdded: isRestaurantAdded)
        } catch let error as NetworkError {
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    func saveImageAndReturnPath(image: Data) -> String {
        return ""
    }
    
    @MainActor
    func updateUI(isRestaurantAdded: Bool) {
        self.isRestaurantAdded = isRestaurantAdded
        errorMessage = nil
    }
    
    @MainActor
    private func reportError(_ error: String) {
        self.isRestaurantAdded = false
        errorMessage = error
    }
}
