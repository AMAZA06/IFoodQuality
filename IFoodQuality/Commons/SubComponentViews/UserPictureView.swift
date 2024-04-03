//
//  UserPictureView.swift
//  IFoodQuality
//
//  Created by amine maza on 31/03/2024.
//

import SwiftUI

struct UserPictureView: View {
    
    private var picture = Image(systemName: "person.circle.fill")
    
    var body: some View {
            Circle()
                .overlay(picture
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .background(Color(uiColor: .background))
                    .foregroundColor(Color(uiColor: .picture)))
                .frame(width: 100, height: 100)
    }
}

#Preview {
    UserPictureView()
}
