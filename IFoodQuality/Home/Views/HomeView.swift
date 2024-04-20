//
//  Home.swift
//  IFoodQuality
//
//  Created by amine maza on 30/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    let isPreviousPossible = false
    
    private let username = "Amine Maza"
    private let userRole = "ADMIN"
    
    private let tasks = ["Task1", "Alert1"]
    
    var body: some View {
        VStack {
            Spacer()
            Text(username)
            Text(userRole).padding()
            Spacer()
            ZStack {
                Rectangle()
                    .opacity(0.05)
                    .shadow(radius: 20)
                    .cornerRadius(6.0)
                
                TasksView()
                    .padding()
                
            }.frame(width: UIScreen.main.bounds.width * 0.88, height: UIScreen.main.bounds.height * 0.45)
            Spacer()
            Spacer()
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .topLeading, endPoint: .bottom)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    HomeView()
}
