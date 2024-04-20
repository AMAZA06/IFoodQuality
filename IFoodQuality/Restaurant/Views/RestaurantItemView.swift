//
//  RestaurantView.swift
//  IFoodQuality
//
//  Created by amine maza on 15/04/2024.
//

import SwiftUI

struct RestaurantItemView: View {
    
    var name: String
    var pictureUri: String?
    var defaultRestaurantPicture = "fork.knife"
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120, height: 120)
                .cornerRadius(6.0)
                .foregroundColor(Color(uiColor: .panel))
            VStack {
                if (pictureUri != nil) {
                    
                    if let image = imageLoader.image {
                        Image(uiImage: image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipped()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1.0))
                            .foregroundColor(.white)
                    } else {
                        ProgressView()
                    }
                } else {
                    Image(systemName: defaultRestaurantPicture)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .overlay(Circle().stroke(.white, lineWidth: 1.0))
                        .foregroundColor(.white)
                }
                Text(name)
                    .fixedSize(horizontal: false, vertical: true)
                    .fontWeight(.regular)
                    .padding()
                    .frame(maxHeight: 55)
            }
        }.onAppear {
            imageLoader.uri = pictureUri
            imageLoader.loadImage()
        }
        .frame(width: 120, height: 120)
    }
}

#Preview {
    RestaurantItemView(name: "Dummy", pictureUri: nil)
}
