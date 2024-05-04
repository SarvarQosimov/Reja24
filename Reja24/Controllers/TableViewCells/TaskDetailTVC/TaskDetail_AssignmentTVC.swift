//
//  TaskDetailAssignmentTVC.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import UIKit

class TaskDetail_AssignmentTVC: TaskDetailBaseTVC {
    
    private let assignmentLabel = UILabel()
    var assignment: String
    var isNote: Bool
    
    init(assignment: String, isNote: Bool = false) {
        self.assignment = assignment
        self.isNote = isNote
        super.init()
        
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews(){
        containerView.addSubview(assignmentLabel)
        assignmentLabel.translatesAutoresizingMaskIntoConstraints = false
        assignmentLabel.text = assignment
        assignmentLabel.numberOfLines = 0
        assignmentLabel.textAlignment = .left
        
        if isNote {
            assignmentLabel.font = UIFont(name: Constants.appFont, size: 15)
            assignmentLabel.textColor = .black
        } else {
            assignmentLabel.font = UIFont(name: Constants.appFont + " Semibold", size: 21)
            assignmentLabel.textColor = .black.withAlphaComponent(0.75)
        }
        
        
        NSLayoutConstraint.activate([
            assignmentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            assignmentLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            assignmentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            assignmentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        ])
        
    }
    
}
