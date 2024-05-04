//
//  SchedualTasks+TableView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 04/08/23.
//

import UIKit

//MARK: setupTableView
extension ScheduledTasksVC {
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTVC.self, forCellReuseIdentifier: TaskTVC.identifire)
    }
}

//MARK: UITableViewDataSource
extension ScheduledTasksVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksWithDeadline.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifire, for: indexPath) as? TaskTVC else { return UITableViewCell()}
        cell.updateCell(
            task      : tasksWithDeadline[indexPath.row].task!,
            isDone    : tasksWithDeadline[indexPath.row].isDone,
            priority  : tasksWithDeadline[indexPath.row].priority!,
            deadline   : tasksWithDeadline[indexPath.row].dedline!,
            img       : tasksWithDeadline[indexPath.row].image ?? "",
            isFlagged : tasksWithDeadline[indexPath.row].isFlagged
        )
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.indexForSchedualed = deadlineIndex[indexPath.row]
        cell.role = .schedualed
        
        return cell
    }
}

//MARK: UITableViewDelegate
extension ScheduledTasksVC: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TasksVC.isTaskDetail = true
        openVcDelegate.openTaskDetailVC(tasksWithDeadline[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
        let delete = UIContextualAction(style: .destructive, title: SetLanguage.setLanguage(.deleteTask)) { [self] _, _, _ in
            contex.delete(tasksWithDeadline[indexPath.row])
            tasksWithDeadline.remove(at: indexPath.row)
            tableView.reloadData()
            taskViewModel.save()
            isTasksEmpty()
        }
        
        let dedline = UIContextualAction(style: .normal, title: SetLanguage.setLanguage(.setDeadline)) { [self] _, _, _ in
            SetTimer.title = tasksWithDeadline[indexPath.row].task!
            SetTimer.priority = tasksWithDeadline[indexPath.row].priority!
            SetTimer.beforSet = tasksWithDeadline[indexPath.row]
            SetTimer.whichTask = deadlineIndex[indexPath.row]
            
            let vc = SetTimer()
            SetTimer.delegate = self
            present(vc, animated: true)
        }
        
        let swipe = UISwipeActionsConfiguration(actions: [delete,dedline])
        
        return swipe
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let edit = UIAction(title: SetLanguage.setLanguage(.editTask)) { [self]_ in
            AddTaskVC.isEditing = (true,tasksWithDeadline[indexPath.row], deadlineIndex[indexPath.row])
            AddTaskVC.delegate = self
            
            let vc = AddTaskVC()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        edit.image = UIImage(systemName: "pencil")
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            return UIMenu(title: "",children: [edit])
        }
        
    }
}
