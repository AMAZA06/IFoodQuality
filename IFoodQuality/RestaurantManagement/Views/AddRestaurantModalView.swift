//
//  AddRestaurantView.swift
//  IFoodQuality
//
//  Created by amine maza on 16/04/2024.
//

import SwiftUI

struct AddRestaurantModalView: View {
    
    @ObservedObject var addRestaurantViewViewModel : AddRestaurantModalViewViewModel
    @Binding var showingSheet: Bool
    
    @State var restaurantPicture: Data?
    
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
            VStack {
                Text(LocalizedStringKey("restaurant.add"))
                    .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                    .fontWeight(.medium)
                    .foregroundColor(.fontGolden)
                    .padding(.bottom, 10)
                PictureView(dataPicture: $restaurantPicture)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.13)
                    .onChange(of: restaurantPicture) {
                        addRestaurantViewViewModel.image = restaurantPicture
                }
                
                
                ErrorPanelView(error: $addRestaurantViewViewModel.errorMessage)
                
                VStack {
                    if (!addRestaurantViewViewModel.isLoading) {
                        PrimaryTextFieldView(text: $addRestaurantViewViewModel.name, label: LocalizedStringKey("textfield.restaurant.name"), isFocused: _isFocused, textfieldId: $textfieldsIds[0])
                            .padding(.bottom, 8)
                        PrimaryTextFieldView(text: $addRestaurantViewViewModel.location, label: LocalizedStringKey("textfield.restaurant.location"), isFocused: _isFocused, textfieldId: $textfieldsIds[1])
                            .padding(.bottom, 8)
                        PrimaryTextFieldView(text: $addRestaurantViewViewModel.contactNumber, label: LocalizedStringKey("textfield.restaurant.contact.number"), isFocused: _isFocused, textfieldId: $textfieldsIds[2])
                            .padding(.bottom, 8)
                        PrimaryTextFieldView(text: $addRestaurantViewViewModel.contactMail, label: LocalizedStringKey("textfield.restaurant.contact.mail"), isFocused: _isFocused, textfieldId: $textfieldsIds[3])
                            .padding(.bottom, 8)
                        PrimaryTextFieldView(text: $addRestaurantViewViewModel.description, label: LocalizedStringKey("textfield.restaurant.description"), isFocused: _isFocused, textfieldId: $textfieldsIds[4])
                            .padding(.bottom, 8)
                        
                    } else {
                        LoadingView()
                    }
                }.frame(width: UIScreen.main.bounds.width * 0.8, height: 55 * 6)
                    .padding(.vertical, 30)
                
                
                ErrorPanelView(error: $addRestaurantViewViewModel.errorMessage)
                    .padding(.bottom, 30)
                
                PrimaryButtonView(buttonLabel: {
                    Label(LocalizedStringKey("button.send"), systemImage: "")
                }, action: {
                    Task {
                        await addRestaurantViewViewModel.addRestaurant()
                    }
                }).onChange(of: addRestaurantViewViewModel.isRestaurantAdded) { oldState, newState in
                      showingSheet = !newState
                }
                
                SecondaryButtonView(buttonLabel: {
                    Label(LocalizedStringKey("button.reset"), systemImage: "")
                }, action: {
                    addRestaurantViewViewModel.reinit()
                })
            }
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], 
                                    startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    AddRestaurantModalView(addRestaurantViewViewModel: AddRestaurantModalViewViewModel(), showingSheet: .constant(true))
}
