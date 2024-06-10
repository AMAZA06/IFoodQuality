//
//  ZoneListView.swift
//  IFoodQuality
//
//  Created by amine maza on 24/04/2024.
//

import SwiftUI

struct ZoneListView: View {
    @ObservedObject var zoneListViewModel: ZoneListViewViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:zoneListViewModel.zones.isEmpty ? 1000 : 170), spacing: 0, alignment: .center)], spacing: 8) {
                
                if (!zoneListViewModel.zones.isEmpty) {
                    ForEach(zoneListViewModel.zones) { zone in
                        ZoneItemView(name: zone.name, description: zone.description, deleteAction: {
                            Task {
                                await zoneListViewModel.deleteZone(zoneId: zone.id ?? 0)
                            }
                        })
                    }
                } else {
                    Spacer()
                    Text(LocalizedStringKey("zone.nozone"))
                        .foregroundColor(.red)
                }
            }
        }.frame(width: UIScreen.main.bounds.width * 0.9)
        .padding(.top, 30)
    }
}

#Preview {
    ZoneListView(zoneListViewModel: ZoneListViewViewModel())
}
