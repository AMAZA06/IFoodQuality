//
//  MenuView.swift
//  IFoodQuality
//
//  Created by amine maza on 03/04/2024.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var loginViewViewModel: LoginViewViewModel
    @State var currentMenuItem = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentMenuItem) {
                HomeView()
                    .tag(0)
                FeaturesView()
                    .tag(1)
                ProfileView(loginViewViewModel: loginViewViewModel)
                    .tag(2)
            }
            ZStack{
                HStack{
                    ForEach((MenuItems.allCases), id: \.self){ item in
                        Button{
                            currentMenuItem = item.rawValue
                        } label: {
                            CustomTabItem(systemImage: item.icon, title: item.title, isActive: (currentMenuItem == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }.frame(width: UIScreen.main.bounds.width * 0.8, height: 70)
                .background(.menu)
                .cornerRadius(35)
                .padding(.horizontal, 10)
        }
        
    }
}

extension MenuView {
    func CustomTabItem(systemImage: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Image(systemName: systemImage)
                .resizable()
                .foregroundColor(isActive ? .menu : .white)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            Spacer()
        }.frame(width: isActive ? UIScreen.main.bounds.width * 0.4 : 60, height: 60)
            .background(isActive ? .menuSelected : .clear)
            .cornerRadius(30)
    }
}

#Preview {
    MenuView(loginViewViewModel: LoginViewViewModel())
}
