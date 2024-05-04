//
//  SchedualTasks.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 22/07/23.
//

import UIKit
import CoreData

class ScheduledTasksVC: UIViewController { 
    
    //MARK: Elements
    var tableView: UITableView!
    let emptyBoxImageView = UIImageView()
    
    //MARK: VARIABLES
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let taskViewModel    = TasksViewModel()
    var tasks            = [TaskDB]()
    var deadlineIndex     = [Int]()
    static var delegate: DataChangedDelegate!
    var tasksWithDeadline = [TaskDB]() {
        didSet {
            isTasksEmpty()
        }
    }
    
    //MARK: lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        TasksForTodayTVC.role = .schedualed
        TaskTVC.finishDelegate = self
        setupViews()
        setupTableView()
        tasks = taskViewModel.fetchTasks()
        sortByDate()
        isTasksEmpty()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !TasksVC.isTaskDetail {
            TasksForTodayTVC.role = .today
            ScheduledTasksVC.delegate.tasksChanged()
        }
    }

    //MARK: sortByDate
    func sortByDate(){
        tasksWithDeadline = []
        deadlineIndex = []
        for i in tasks.enumerated() {
            if !i.element.dedline!.isEmpty {
                tasksWithDeadline.append(i.element)
                deadlineIndex.append(i.offset)
            }
        }
        tableView.reloadData()
    }
    
    //MARK: isTaskEmpty
    func isTasksEmpty(){
        if tasksWithDeadline.count == 0 {
            emptyBoxImageView.isHidden = false
        } else {
            emptyBoxImageView.isHidden = true
        }
    }
}
