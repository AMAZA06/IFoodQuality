//
//  AddUserModalView.swift
//  IFoodQuality
//
//  Created by amine maza on 04/05/2024.
//

import SwiftUI

struct AddUserModalView: View {
    
    @StateObject var addUserViewModel = AddUserModalViewViewModel()
    
    @Binding var showingSheet: Bool
    
    @FocusState var isFocused: UUID?
    @State var textfieldsIds: [UUID] = [
        UUID(),
        UUID(),
        UUID(),
        UUID(),
        UUID()
    ]
    @State var isEndingDate: Bool = false
    
    @State var formHeight: CGFloat = 7 * 55
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("restaurant.add"))
                .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                .fontWeight(.medium)
                .foregroundColor(.fontGolden)
                .padding(.bottom, 10)
            
            ErrorPanelView(error: $addUserViewModel.errorMessage)
            
            VStack {
                if (!addUserViewModel.isLoading) {
                    PrimaryTextFieldView(text: $addUserViewModel.fullname, label: LocalizedStringKey("textfield.user.name"), isFocused: _isFocused, textfieldId: $textfieldsIds[0])
                        .padding(.bottom, 8)
                    PrimaryTextFieldView(text: $addUserViewModel.mail, label: LocalizedStringKey("textfield.user.mail"), isFocused: _isFocused, textfieldId: $textfieldsIds[1])
                        .padding(.bottom, 8)
                    PrimaryTextFieldView(text: $addUserViewModel.phoneNumber, label: LocalizedStringKey("textfield.user.phone.number"), isFocused: _isFocused, textfieldId: $textfieldsIds[2])
                        .padding(.bottom, 8)
                    PrimaryDatePickerView(label: LocalizedStringKey("textfield.user.starting.date"), date: $addUserViewModel.startingDate)
                    Button(isEndingDate ? LocalizedStringKey("textfield.user.hide.ending.date") : LocalizedStringKey("textfield.user.provide.ending.date")) {
                        withAnimation {
                            isEndingDate.toggle()
                        }
                        if isEndingDate {
                            addUserViewModel.endingDate = Date()
                            formHeight += 55
                        } else {
                            addUserViewModel.endingDate = nil
                            formHeight -= 55
                        }
                    }
                    
                    if isEndingDate {
                        if let _ = addUserViewModel.endingDate {
                            PrimaryDatePickerView(label: LocalizedStringKey("textfield.user.ending.date"), date: Binding($addUserViewModel.endingDate)!)
                                .transition(.scale)
                        } else {
                            Text(LocalizedStringKey("error.occured"))
                                .foregroundColor(.red)
                        }
                    }
                    
                    PrimaryPickerView<Role>(label: LocalizedStringKey("textfield.user.role"), field: $addUserViewModel.roleId, pickerArray: Role.allCases)
                    
                } else {
                    LoadingView()
                }
            }.frame(width: UIScreen.main.bounds.width * 0.8, height: formHeight)
            
            PrimaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.send"), systemImage: "")
            }, action: {
                Task {
                    await addUserViewModel.addUser()
                }
            }).onChange(of: addUserViewModel.isUserAdded) { oldState, newState in
                showingSheet = !newState
            }
            
            SecondaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.reset"), systemImage: "")
            }, action: {
                addUserViewModel.reinit()
            })
            
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)],
                                    startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    AddUserModalView(showingSheet: .constant(true))
}
