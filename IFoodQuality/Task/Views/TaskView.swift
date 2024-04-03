//
//  TaskView.swift
//  IFoodQuality
//
//  Created by amine maza on 31/03/2024.
//

import SwiftUI

struct TaskView: View {
    
    @StateObject var task: TaskViewViewModel
    
    private var taskColor: Color {
        switch (task.taskType) {
        case TaskType.TASK:
            return Color(uiColor: .task)
        case TaskType.ALERT:
            return Color(uiColor: .taskAlert)
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(3.5)
                .foregroundColor(taskColor)
            
            Text(LocalizedStringKey(task.taskLabel))
        }.frame(height: 45, alignment: .center)
    }
}

#Preview {
    TaskView(task: TaskViewViewModel(taskType: .TASK, taskLabel: "Task"))
}
