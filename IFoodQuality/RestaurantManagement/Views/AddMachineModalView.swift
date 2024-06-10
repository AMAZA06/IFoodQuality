//
//  AddMachineModalView.swift
//  IFoodQuality
//
//  Created by amine maza on 28/04/2024.
//

import SwiftUI

struct AddMachineModalView: View {
    
    @Binding var showingSheet: Bool
    
    @ObservedObject var addMachineViewModel: AddMachineModalViewViewModel
    @ObservedObject var zoneListViewModel: ZoneListViewViewModel
    
    @FocusState var isFocused: UUID?
    @State var textfieldsIds: [UUID] = [
        UUID(),
        UUID()
    ]
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("machine.add"))
                .frame(width: UIScreen.main.bounds.width * 0.7, alignment: .leading)
                .fontWeight(.medium)
                .font(.system(size: 35))
                .foregroundColor(.fontGolden)
                .padding(.bottom, 30)
            VStack {
                PrimaryTextFieldView(text: $addMachineViewModel.label, label: LocalizedStringKey("textfield.machine.label"), isFocused: _isFocused, textfieldId: $textfieldsIds[0])
                    .padding(.bottom, 8)
                PrimaryTextFieldView(text: $addMachineViewModel.reference, label: LocalizedStringKey("textfield.machine.reference"), isFocused: _isFocused, textfieldId: $textfieldsIds[1])
                    .padding(.bottom, 8)
                
                if (zoneListViewModel.zones.isEmpty && (addMachineViewModel.targetZoneId == 0)) {
                    Text(LocalizedStringKey("machine.nozone"))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .center)
                } else {
                    PrimaryPickerView(label: LocalizedStringKey("textfield.machine.target.zone"), field: $addMachineViewModel.targetZoneId, pickerArray: zoneListViewModel.zones)
                }
            }
            .frame(height: 250)
            .onAppear {
                if let targetZone = zoneListViewModel.zones.first {
                    addMachineViewModel.targetZoneId = targetZone.id!
                }
            }
            
            PrimaryButtonView(buttonLabel: {
                Label(LocalizedStringKey("button.send"), image: "")
            }, action: {
                Task {
                    await addMachineViewModel.addMachine()
                }
            }).onChange(of: addMachineViewModel.isMachineAdded) { oldState, newState in
                showingSheet = !newState
            }
            
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    AddMachineModalView(showingSheet: .constant(true),
        addMachineViewModel: AddMachineModalViewViewModel(), zoneListViewModel: ZoneListViewViewModel())
}
