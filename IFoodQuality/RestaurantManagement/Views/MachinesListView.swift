//
//  MachinesListViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 29/04/2024.
//

import SwiftUI

struct MachinesListView: View {
    
    @ObservedObject var machineListViewModel: MachineListViewViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:machineListViewModel.machines.isEmpty ? 1000 : 170), spacing: 0, alignment: .center)], spacing: 8) {
                
                if (!machineListViewModel.machines.isEmpty) {
                    ForEach(machineListViewModel.machines) { machine in
                        MachineItemView(label: machine.label, reference: machine.reference, deleteAction: {
                            Task {
                                await machineListViewModel.deleteMachine(machineId: machine.id)
                            }
                        })
                    }
                } else {
                    Spacer()
                    Text(LocalizedStringKey("machine.nomachine"))
                        .foregroundColor(.red)
                }
            }
        }.frame(width: UIScreen.main.bounds.width * 0.9)
            .padding(.top, 30)
    }
}

#Preview {
    MachinesListView(machineListViewModel: MachineListViewViewModel())
}
