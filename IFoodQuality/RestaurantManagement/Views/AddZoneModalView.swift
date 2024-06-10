//
//  AddZoneModalView.swift
//  IFoodQuality
//
//  Created by amine maza on 24/04/2024.
//

import SwiftUI

struct AddZoneModalView: View {
    
    @Binding var showingSheet: Bool
    @ObservedObject var addZoneViewModel: AddZoneModalViewViewModel
    
    @FocusState var isFocused: UUID?
    @State var textfieldsIds: [UUID] = [
        UUID(),
        UUID()
    ]
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("zone.add"))
                .frame(width: UIScreen.main.bounds.width * 0.7, alignment: .leading)
                .fontWeight(.medium)
                .foregroundColor(.fontGolden)
                .padding(.bottom, 30)
            VStack {
                PrimaryTextFieldView(text: $addZoneViewModel.name, label: LocalizedStringKey("textfield.zone.name"), isFocused: _isFocused, textfieldId: $textfieldsIds[0])
                    .padding(.bottom, 8)
                PrimaryTextFieldView(text: $addZoneViewModel.description, label: LocalizedStringKey("textfield.zone.description"), isFocused: _isFocused, textfieldId: $textfieldsIds[1])
                    .padding(.bottom, 8)
                
                if let error = addZoneViewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
                Spacer()
            }
            .frame(height: 250)
            
            PrimaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.send"), systemImage: "")
            }, action: {
                Task {
                    await addZoneViewModel.addZone()
                }
            }).onChange(of: addZoneViewModel.isZoneAdded) { oldState, newState in
                showingSheet = !newState
            }
            
            SecondaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.reset"), systemImage: "")
            }, action: {
                addZoneViewModel.reinit()
            })
        }.scrollContentBackground(.hidden)
        .background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    AddZoneModalView(showingSheet: .constant(false), addZoneViewModel: AddZoneModalViewViewModel())
}
