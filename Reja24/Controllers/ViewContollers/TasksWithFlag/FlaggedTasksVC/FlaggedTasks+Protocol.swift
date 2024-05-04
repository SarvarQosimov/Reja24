//
//  FlaggedTasks+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/09/23.
//

import Foundation
import UIKit

extension FlaggedTasksVC: FinishedDelegate {
    func isDone(_ index: Int) {
        flaggedTasks[index].isDone = !flaggedTasks[index].isDone
        viewModel.save()
        getFlaggedTasks()
    }
}

extension FlaggedTasksVC: DataChangedDelegate {
    func foldersChanged() {
        // update folder
    }
    
    func categoriesChanged() {
        // update category
    }
    
    func tasksChanged() {
        getFlaggedTasks()
        isTaskEmpty()
    }
    
    
}
