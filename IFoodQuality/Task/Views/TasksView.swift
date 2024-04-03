//
//  TasksView.swift
//  IFoodQuality
//
//  Created by amine maza on 01/04/2024.
//

import SwiftUI

struct TasksView: View {
    
    @ObservedObject var tasksViewViewModel = TasksViewViewModel.init()
    
    var body: some View {
        ScrollView {
            ForEach(tasksViewViewModel.tasks.indices, id: \.self) { index in
                TaskView(task: tasksViewViewModel.tasks[index])
            }
        }
    }
}

#Preview {
    TasksView()
}
