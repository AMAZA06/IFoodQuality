//
//  MachinesView.swift
//  IFoodQuality
//
//  Created by amine maza on 20/04/2024.
//

import SwiftUI

struct MachinesView: View {
    var restaurantId: Int
    
    @ObservedObject var zoneListViewModel: ZoneListViewViewModel
    
    @StateObject var addMachineViewModel = AddMachineModalViewViewModel()
    @StateObject var machineListViewModel = MachineListViewViewModel()
    
    var body: some View {
        VStack {
            AddMachineButtonView(addMachineViewModel: addMachineViewModel,
                                 zoneListViewModel: zoneListViewModel)
            
            if (addMachineViewModel.isMachineAdded) {
                NotificationView(type: .SUCCESS, message: LocalizedStringKey("machine.added"))
            }
            if (machineListViewModel.isLoading) {
                LoadingView()
            }
            MachinesListView(machineListViewModel: machineListViewModel)
            
        }.onAppear {
            machineListViewModel.restaurantId = restaurantId
            Task {
                await machineListViewModel.fetchMachinesByRestaurant()
            }
        }
        .onChange(of: addMachineViewModel.isMachineAdded) {
            addMachineViewModel.reinit()
            Task {
                await machineListViewModel.fetchMachinesByRestaurant()
            }
        }
    }
}

#Preview {
    MachinesView(restaurantId: 0, zoneListViewModel: ZoneListViewViewModel(),
                 machineListViewModel: MachineListViewViewModel())
}
