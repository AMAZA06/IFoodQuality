//
//  NoInternetView.swift
//  IFoodQuality
//
//  Created by amine maza on 01/05/2024.
//

import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack  {
            Spacer()
            Text(LocalizedStringKey("no.internet"))
                .padding(.bottom, 50)
                .font(.system(size: 30.0))
            
            Image(systemName: "wifi.slash")
                .font(.system(size: 50.0))
            Spacer()
        }.background(LinearGradient(colors: [Color(.backgroundGolden), Color(.backgroundGreen)],
                                    startPoint: .bottom, endPoint: .top)
        .frame(width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height * 2))
    }
}

#Preview {
    NoInternetView()
}
