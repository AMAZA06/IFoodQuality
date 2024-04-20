//
//  FeaturesView.swift
//  IFoodQuality
//
//  Created by amine maza on 03/04/2024.
//

import SwiftUI

struct FeaturesListView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:150))], spacing: 20) {
                    ForEach(Features.allCases, id: \.self) { feature in
                        ZStack {
                            NavigationLink(value: feature) {
                                VStack {
                                    Image(systemName: feature.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 30)
                                        .foregroundColor(.white)
                                    Text(feature.title)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .contentShape(Rectangle())
                            }
                        }
                        .frame(width: 150, height: 150)
                    }
                }
                
            }.navigationDestination(for: Features.self) { feature in
                feature.view
            }
            .background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)], startPoint: .topLeading, endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height * 2))
        }
    }
}


#Preview {
    FeaturesListView()
}
