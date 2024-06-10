//
//  RestaurantView.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import SwiftUI

struct RestaurantView: View {
    
    
    var defaultRestaurantPicture = "fork.knife"
    
    var restaurantId: Int = 0
    @StateObject var restaurantViewModel = RestaurantViewViewModel()
    
    var pictureUri: String?
    
    @State var selectedTab = RestaurantTab.tabRestaurant
    
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        VStack {
            HStack {
                if (pictureUri != nil) {
                    if let image = imageLoader.image {
                        Image(uiImage: image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
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
                        .frame(width: 80, height: 80)
                        .overlay(Circle().stroke(.white, lineWidth: 1.0))
                        .foregroundColor(.white)
                }
            }.frame(width: UIScreen.main.bounds.width, alignment: .center)
            
            RestaurantTabView(restaurantId: restaurantId)
        
            
        }
        .onAppear {
            imageLoader.uri = pictureUri
            imageLoader.loadImage()
        }
        .background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .bottom, endPoint: .top)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 2))
        
    }
}

#Preview {
    RestaurantView()
}
