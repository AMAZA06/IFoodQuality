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
        VStack {
            HeaderView()
                .padding()
                .frame(height: UIScreen.main.bounds.height * 0.1)
            ZStack(alignment: .bottom) {
                TabView(selection: $currentMenuItem) {
                    HomeView()
                        .tag(0)
                    FeaturesView()
                        .tag(1)
                    ProfileView(loginViewViewModel: loginViewViewModel)
                        .tag(2)
                }
                .frame(height: UIScreen.main.bounds.height * 0.9)
                Spacer()
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
                }.frame(width: UIScreen.main.bounds.width, height: 70)
                    .background(.menu)
                    .padding()
            }.frame(height: UIScreen.main.bounds.height * 0.9)
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .topLeading, endPoint: .bottom)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

extension MenuView {
    func CustomTabItem(systemImage: String, title: String, isActive: Bool) -> some View {
        VStack() {
            Spacer()
            Image(systemName: systemImage)
                .resizable()
                .foregroundColor(isActive ? .white : .white)
                .frame(width: 20, height: 20)
            Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            Spacer()
        }.frame(width: UIScreen.main.bounds.width * 0.3, height : 50)
        .background(isActive ? .menuSelected : .clear)
            .cornerRadius(30)
    }
}

#Preview {
    MenuView(loginViewViewModel: LoginViewViewModel())
}
