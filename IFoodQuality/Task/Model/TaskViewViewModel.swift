//
//  TaskViewViewModel.swift
//  IFoodQuality
//
//  Created by amine maza on 01/04/2024.
//

import Foundation

class TaskViewViewModel: ObservableObject {
    
    @Published var taskType: TaskType = TaskType.TASK
    @Published var taskLabel: String = ""
    
    init(taskType: TaskType, taskLabel: String) {
        self.taskType = taskType
        self.taskLabel = taskLabel
    }
    
}
