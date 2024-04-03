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
            HeaderView(isPreviousPossible: isPreviousPossible)
            
            UserPictureView()
                .padding()
            
            Text(username)
            Text(userRole).padding()
            
            ZStack {
                Rectangle()
                    .foregroundColor(.panel)
                    .opacity(0.3)
                    .shadow(radius: 20)
                    .cornerRadius(6.0)
                
                TasksView()
                    .padding()
                
            }.frame(width: UIScreen.main.bounds.width * 0.88, height: UIScreen.main.bounds.height * 0.45)
            Spacer()
            
        }.background(Color(uiColor: .background)
            .frame(width: UIScreen.main.bounds.width * 2,
                   height: UIScreen.main.bounds.height * 2))
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
    }
}

#Preview {
    HomeView()
}
