//
//  LoadingView.swift
//  IFoodQuality
//
//  Created by amine maza on 29/04/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text(LocalizedStringKey("loading"))
            ProgressView()
        }
    }
}

#Preview {
    LoadingView()
}
