//
//  RestaurantDetailsView.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    var restaurantId: Int
    @StateObject var restaurantDetails = RestaurantViewViewModel()
    
    @FocusState var isFocused: UUID?
    @State var textfieldsIds: [UUID] = [
        UUID(),
        UUID(),
        UUID(),
        UUID(),
        UUID()
    ]
    
    var body: some View {
        VStack {
            if let errorMessage = restaurantDetails.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            VStack {
                PrimaryTextFieldView(text: $restaurantDetails.name, label: LocalizedStringKey("textfield.restaurant.name"), isFocused: _isFocused, textfieldId: $textfieldsIds[0])
                    .padding(.bottom, 8)
                PrimaryTextFieldView(text: $restaurantDetails.contactMail, label: LocalizedStringKey("textfield.restaurant.contact.mail"), isFocused: _isFocused, textfieldId: $textfieldsIds[1])
                    .padding(.bottom, 8)
                PrimaryTextFieldView(text: $restaurantDetails.contactNumber, label: LocalizedStringKey("textfield.restaurant.contact.number"), isFocused: _isFocused, textfieldId: $textfieldsIds[2])
                    .padding(.bottom, 8)
                PrimaryTextFieldView(text: $restaurantDetails.location, label: LocalizedStringKey("textfield.restaurant.location"), isFocused: _isFocused, textfieldId: $textfieldsIds[3])
                    .padding(.bottom, 8)
                PrimaryTextFieldView(text: $restaurantDetails.description, label: LocalizedStringKey("textfield.restaurant.description"), isFocused: _isFocused, textfieldId: $textfieldsIds[4])
                    .padding(.bottom, 8)
            }
            
            PrimaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.modify"), systemImage: "")
            }, action: {
                //todo
                print("test")
            })
        }.onAppear {
            Task {
                restaurantDetails.id = restaurantId
                await restaurantDetails.fetchRestaurantDetails()
            }
        }
    }
}

#Preview {
    RestaurantDetailsView(restaurantId: 0)
}
