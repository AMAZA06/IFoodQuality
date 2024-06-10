//
//  MyInformationView.swift
//  IFoodQuality
//
//  Created by amine maza on 05/04/2024.
//

import SwiftUI

struct MyInformationsView: View {
    
    @StateObject var viewModel =    MyInformationsViewViewModel()
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey(""))
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage).foregroundColor(.red)
            }
            
            
            List {
                Text(viewModel.fullname)
                Text(viewModel.role)
                Text(viewModel.mail)
                Text(viewModel.phoneNumber)
                Text(viewModel.startingDate)
            }.onAppear {
                Task {
                    await viewModel.fetchMyProfile()
                }
            }.scrollContentBackground(.hidden)
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    MyInformationsView()
}
