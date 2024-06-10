//
//  AddZoneButtonView.swift
//  IFoodQuality
//
//  Created by amine maza on 24/04/2024.
//

import SwiftUI

struct AddZoneButtonView: View {
    
    @State var showingSheet: Bool = false
    @ObservedObject var addZoneViewModel: AddZoneModalViewViewModel
    
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
            AddZoneModalView(showingSheet: $showingSheet, addZoneViewModel: addZoneViewModel)
        }
    }
}

#Preview {
    AddZoneButtonView(addZoneViewModel: AddZoneModalViewViewModel())
}
