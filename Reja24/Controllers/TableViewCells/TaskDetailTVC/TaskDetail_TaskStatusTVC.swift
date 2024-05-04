//
//  TaskDetail_TaskStatusTVC.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import UIKit

class TaskDetail_TaskStatusTVC: TaskDetailBaseTVC {
    
    private let statusLabelTitle = UILabel()
    let statusView = UIView()
    private let statusLabel = UILabel()
    var status: Bool
    
    init(status: Bool) {
        self.status = status
        super.init()
        
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews(){
        containerView.addSubview(statusLabelTitle)
        statusLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        statusLabelTitle.font = UIFont(name: Constants.appFont + " Semibold", size: 21)
        statusLabelTitle.textColor = .primaryAppColor
        statusLabelTitle.text = SetLanguage.setLanguage(.status)
        
        containerView.addSubview(statusView)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.backgroundColor = .primaryAppColor
        statusView.layer.cornerRadius = 17
        statusView.clipsToBounds = true
        
        statusView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = status ? SetLanguage.setLanguage(.finished) : SetLanguage.setLanguage(.notFinished)
        statusLabel.font = UIFont(name: Constants.appFont, size: 17)
        statusLabel.textColor = .white
        
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLabelTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            statusLabelTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            statusView.widthAnchor.constraint(equalToConstant: 125),
            statusView.heightAnchor.constraint(equalToConstant: 35),
            statusView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            statusView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            statusView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            
            statusLabel.centerXAnchor.constraint(equalTo: statusView.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor)
        ])
    }
    
}
