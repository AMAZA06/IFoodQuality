//
//  AddMachineButtonView.swift
//  IFoodQuality
//
//  Created by amine maza on 28/04/2024.
//

import SwiftUI

struct AddMachineButtonView: View {
    
    @State var showingSheet: Bool = false
    @ObservedObject var addMachineViewModel: AddMachineModalViewViewModel
    @ObservedObject var zoneListViewModel: ZoneListViewViewModel
    
    var body: some View {
        Button(action :  {
            showingSheet.toggle()
        }, label: {
            Circle()
                .foregroundColor(Color(uiColor: .panel))
                .overlay(
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                )
                .frame(width: 100, height: 100)
        }).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $showingSheet) {
            AddMachineModalView(showingSheet: $showingSheet, addMachineViewModel: addMachineViewModel, zoneListViewModel: zoneListViewModel)
        }
    }
}

#Preview {
    AddMachineButtonView(addMachineViewModel: AddMachineModalViewViewModel(), zoneListViewModel: ZoneListViewViewModel())
}
