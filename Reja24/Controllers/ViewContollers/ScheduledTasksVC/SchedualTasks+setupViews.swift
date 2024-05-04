//
//  SchedualTasks+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 07/10/23.
//

import Foundation
import UIKit

extension ScheduledTasksVC {
    //MARK: setupViews
    func setupViews(){
        tableView = UITableView(frame: view.frame, style: .plain)

        addSubviews()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        title = SetLanguage.setLanguage(.scheduledTasksTitle)
        view.backgroundColor = Constants.mainBackgroundColor
        TasksForTodayTVC.role = .schedualed
        
        emptyBoxImageView.translatesAutoresizingMaskIntoConstraints = false
        emptyBoxImageView.image = UIImage(named: "emptyBoxImage")
        emptyBoxImageView.contentMode = .scaleAspectFit
        
        addConstraints()
    }

    private func addSubviews(){
        view.addSubview(tableView)
        view.addSubview(emptyBoxImageView)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            
            emptyBoxImageView.widthAnchor.constraint(equalToConstant: windowWidth/2),
            emptyBoxImageView.heightAnchor.constraint(equalToConstant: windowWidth/2),
            emptyBoxImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyBoxImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    
}
