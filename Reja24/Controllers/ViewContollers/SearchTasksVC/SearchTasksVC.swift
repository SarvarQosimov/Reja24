//
//  SearchTasksVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 30/08/23.
//

import UIKit

class SearchTasksVC: UIViewController {
    
    let searchTF         = UITextField()
    var tableView:         UITableView!
    var customBackButton = UIBarButtonItem()

    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var searchedTasks  = [TaskDB]()
    var searchingIndex = [Int]()
    var tasks          = [TaskDB]()
    let viewModel      = TasksViewModel()
    var serchingText   = ""
    static var taskUpdatedDelegate: DataChangedDelegate!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        TasksForTodayTVC.role = .searched
        TaskTVC.finishDelegate = self
        setupViews()
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !TasksVC.isTaskDetail {
            TasksForTodayTVC.role = .today
            SearchTasksVC.taskUpdatedDelegate.tasksChanged()
        }
    }
    
    @objc func donePressed(_ sender: Any){
        searchTF.resignFirstResponder()
    }
    
    //MARK: updateSearch
    func updateSearch(){
        tasks = viewModel.fetchTasks()
        searchedTasks = []
        searchingIndex = []
        
        let text = serchingText.lowercased()
        
        for i in tasks.enumerated() {
            if let iTask = i.element.task?.lowercased() {
                if iTask.contains(text) {
                    searchedTasks.append(i.element)
                    searchingIndex.append(i.offset)
                }
            } else {
                print("nil")
            }
        }
        tableView.reloadData()
    }
}

//MARK: UISearchBarDelegate
extension SearchTasksVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tasks = viewModel.fetchTasks()
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
//        textField.text = "  \(textField.text)"
        serchingText = textField.text ?? ""//String((textField.text ?? "").dropFirst(2))
        
        searchedTasks = []
        searchingIndex = []
        print("textFieldDidChangeSelection")
        let text = serchingText.lowercased()
        
        for i in tasks.enumerated() {
            if let iTask = i.element.task?.lowercased() {
                if iTask.contains(text) {
                    searchedTasks.append(i.element)
                    searchingIndex.append(i.offset)
                }
            } else {
                print("nil")
            }
        }
        
        tableView.reloadData()
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("shouldChangeCharactersIn")
//        
//        if let currentText = textField.text,
//           let textRange = Range(range, in: currentText) {
//            // Append two spaces before the entered text
//            let newText = "  " + currentText.replacingCharacters(in: textRange, with: string)
//            // Update the text field's text
//            textField.text = newText
//            // Return false to prevent the text from being replaced again by the system
//            return true //TODO: - false edi
//        }
//        
//        return true
//    }
    
}
