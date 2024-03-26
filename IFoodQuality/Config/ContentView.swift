//
//  ContentView.swift
//  IFoodQuality
//
//  Created by amine maza on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
           
            VStack {
                LoginView()
            } 
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
