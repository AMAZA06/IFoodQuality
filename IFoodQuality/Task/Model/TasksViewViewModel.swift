//
//  TasksViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 01/04/2024.
//

import Foundation

class TasksViewViewModel: ObservableObject {
    
    @Published var tasks: [TaskViewViewModel] = []
    
    init() {
        mockTask()
    }
    
    func mockTask() {
        tasks.append(TaskViewViewModel(taskType: .TASK, taskLabel: "Task 1"))
        tasks.append(TaskViewViewModel(taskType: .ALERT, taskLabel: "Task 2"))
        tasks.append(TaskViewViewModel(taskType: .TASK, taskLabel: "Task 3"))
        tasks.append(TaskViewViewModel(taskType: .ALERT, taskLabel: "Task 4"))
        tasks.append(TaskViewViewModel(taskType: .ALERT, taskLabel: "Task 5"))
        tasks.append(TaskViewViewModel(taskType: .ALERT, taskLabel: "Task 6"))
        tasks.append(TaskViewViewModel(taskType: .TASK, taskLabel: "Task 7"))
        tasks.append(TaskViewViewModel(taskType: .TASK, taskLabel: "Task 8"))
        tasks.append(TaskViewViewModel(taskType: .TASK, taskLabel: "Task 9"))
        tasks.append(TaskViewViewModel(taskType: .ALERT, taskLabel: "Task 10"))
    }
    
}
