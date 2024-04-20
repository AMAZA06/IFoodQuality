//
//  MyProfileViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 07/04/2024.
//

import Foundation

class MyInformationsViewViewModel: ObservableObject {
    
    @Published var fullname: String = ""
    @Published var mail: String = ""
    @Published var phoneNumber: String = ""
    @Published var startingDate: String = ""
    @Published var role: String = ""
    
    @Published var errorMessage: String?
    
    func fetchMyProfile() async {
        do {
            let profile = try await ProfileApi().fetchMyProfile()
            await updateUI(with: profile)
        } catch let error as NetworkError{
            await reportError(error.description())
        } catch {
            await reportError(error.localizedDescription)
        }
    }
    
    @MainActor
    private func updateUI(with profile: MyProfileData) {
        fullname = profile.fullname
        mail = profile.mail
        phoneNumber = profile.phoneNumber
        startingDate = profile.startingDate
        role = profile.role
        errorMessage = nil
    }
    
    @MainActor
    private func reportError(_ error: String) {
        errorMessage = error
    }
    
}
