//
//  UsersView.swift
//  IFoodQuality
//
//  Created by amine maza on 04/04/2024.
//

import SwiftUI

struct UsersView: View {
    
    
    @State var userSearchKeyword: String = ""
    var filterAction = {}
    
    var body: some View {
        VStack {
            FilterView(searchingText: $userSearchKeyword, filterAction: filterAction)
            UserListView()
        }
        .background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], 
                                   startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    UsersView()
}
