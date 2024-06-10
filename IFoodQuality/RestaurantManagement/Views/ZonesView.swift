//
//  ZonesView.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import SwiftUI

struct ZonesView: View {
    
    var restaurantId: Int
    @StateObject var addZoneViewModel = AddZoneModalViewViewModel()
    @ObservedObject var zoneListViewModel : ZoneListViewViewModel
    
    var body: some View {
        VStack {
            AddZoneButtonView(addZoneViewModel: addZoneViewModel)
            
            if (addZoneViewModel.isZoneAdded) {
                NotificationView(type: .SUCCESS, message: LocalizedStringKey("zone.added"))
            }
            if (zoneListViewModel.isDeleted) {
                NotificationView(type: .SUCCESS, message: LocalizedStringKey("zone.deleted"))
            }
            if (zoneListViewModel.isLoading) {
                LoadingView()
            }
            ZoneListView(zoneListViewModel: zoneListViewModel)
        }
        .onAppear {
            addZoneViewModel.restaurantId = restaurantId
            zoneListViewModel.restaurantId = restaurantId
            Task {
                await zoneListViewModel.fetchZonesByRestaurant()
            }
        }.onChange(of: addZoneViewModel.isZoneAdded) {
            addZoneViewModel.reinit()
            Task {
                await zoneListViewModel.fetchZonesByRestaurant()
            }
        }
    }
}

#Preview {
    ZonesView(restaurantId: 0, zoneListViewModel: ZoneListViewViewModel())
}
