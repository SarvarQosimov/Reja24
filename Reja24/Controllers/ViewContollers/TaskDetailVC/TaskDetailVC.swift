//
//  TaskDetailVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 29/08/23.
//

import UIKit

class TaskDetailVC: UIViewController {

    //MARK: views
    let taskImage  = UIImageView()
    let taskLbl    = UILabel()
    let taskName   = UILabel()
    let noteLbl    = UILabel()
    let note       = UILabel()
    let stack      = UIStackView()
    let stack1     = UIStackView()
    let stack2     = UIStackView()
    let doneLbl    = UILabel()
    let isDone     = UISwitch()
    let calendar   = Calendar.current
    let datePicker = UIDatePicker()

    
    let tableView = UITableView()
    
    //MARK: Variables
    var dateComponents = DateComponents()
    var yearString     = ""
    var monthString    = ""
    var dayString      = ""
    var hourString     = ""
    var minuteString   = ""
    
    var task: TaskDB
    
    var taskDetails: [TaskDetailBaseTVC] = []
    
    init(task: TaskDB) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
        
        setTaskDetails()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backgroundColor = .primaryAppColor
        TasksVC.isTaskDetail = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.backgroundColor = Constants.mainBackgroundColor
    
    }
    
    func setTaskDetails(){
        if let taskImage = task.image?.toImage() {
            taskDetails.append(TaskDetail_ImageTVC(taskImage: taskImage))
        }
        
        if let taskName = task.task {
            taskDetails.append(TaskDetail_AssignmentTVC(assignment: taskName))
        }
        
        if let taskNote = task.note, !taskNote.isEmpty {
            taskDetails.append(TaskDetail_AssignmentTVC(assignment: taskNote, isNote: true))
        }
        
        taskDetails.append(TaskDetail_TaskStatusTVC(status: task.isDone))
        
        if let taskDeadline = task.dedline, !taskDeadline.isEmpty {
            taskDetails.append(TaskDetail_DeadlineTVC(taskDeadline))
        }
        
    }
    
    //MARK: updateView
    func updateView(_ data: TaskDB){
        if let img = data.image?.toImage() {
            taskImage.image = img
        } else {
            taskImage.image = UIImage(named: "noimage")
        }
        
        taskName.text = " \(data.task ?? "no task") "
        note.text = data.note
        
        switch data.priority {
        case "High": taskName.layer.borderColor = UIColor.red.cgColor
        case "Medium": taskName.layer.borderColor = UIColor.systemYellow.cgColor
        default: taskName.layer.borderColor = UIColor.systemGreen.cgColor
        }
        
        if data.isDone {
            self.isDone.isOn = true
        } else {
            self.isDone.isOn = false
        }
//        setupDatePicker(data.dedline ?? "")
    }
    
    //MARK: setupDatePicker
    
}
