//
//  UserListView.swift
//  IFoodQuality
//
//  Created by amine maza on 01/05/2024.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:300))], spacing: 40) {
                AddUserButtonView()
            }
        }
    }
}

#Preview {
    UserListView()
}
