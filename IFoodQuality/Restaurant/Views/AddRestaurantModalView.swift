//
//  AddRestaurantView.swift
//  IFoodQuality
//
//  Created by amine maza on 16/04/2024.
//

import SwiftUI

struct AddRestaurantModalView: View {
    
    @ObservedObject var addRestaurantViewViewModel : AddRestaurantViewViewModel
    @Binding var showingSheet: Bool
    
    @State var restaurantPicture: Data?
    
    var body: some View {
        VStack {
            if (addRestaurantViewViewModel.errorMessage != nil) {
                Text(addRestaurantViewViewModel.errorMessage!)
                    .foregroundColor(.red)
            }
            VStack {
                ZStack {
                    PictureView(dataPicture: $restaurantPicture)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.13)
                        .onChange(of: restaurantPicture) {
                            addRestaurantViewViewModel.image = restaurantPicture
                        }
                }
                Form {
                    Section {
                        TextField(LocalizedStringKey("textfield.restaurant.name"), text: $addRestaurantViewViewModel.name)
                            .background(Color(.backgroundGolden))
                            .border(Color(.backgroundGolden))
                    }
                    Section {
                        TextField(LocalizedStringKey("textfield.restaurant.location"), text: $addRestaurantViewViewModel.location)
                    }
                    Section {
                        TextField(LocalizedStringKey("textfield.restaurant.contact.number"), text: $addRestaurantViewViewModel.contactNumber)
                    }
                    Section {
                        TextField(LocalizedStringKey("textfield.restaurant.contact.mail"), text: $addRestaurantViewViewModel.contactMail)
                    }
                    Section {
                        TextField(LocalizedStringKey("textfield.restaurant.description"), text: $addRestaurantViewViewModel.description)
                    }
                    
                   
                }
                .colorScheme(.light)
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.4)
                PrimaryButtonView(buttonLabel: {
                    Label(LocalizedStringKey("button.send"), systemImage: "")
                }, action: {
                    Task {
                        await addRestaurantViewViewModel.addRestaurant()
                    }
                }).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .onChange(of: addRestaurantViewViewModel.isRestaurantAdded) { oldState, newState in
                        showingSheet = !newState
                    }
            }
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .topLeading, endPoint: .bottom)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    AddRestaurantModalView(addRestaurantViewViewModel: AddRestaurantViewViewModel(), showingSheet: .constant(true))
}
