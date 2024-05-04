//
//  FlaggedTasks+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/09/23.
//

import Foundation
import UIKit

extension FlaggedTasksVC {
    //MARK: setupView
    func setupView(){
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : Constants.textColor
        ]
        
        navigationController?.navigationBar.backgroundColor = Constants.mainBackgroundColor
        navigationController?.navigationBar.tintColor = .systemBlue
        
        view.backgroundColor = Constants.mainBackgroundColor
        title = SetLanguage.setLanguage(.flaggedTitle)
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.task)
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        
        getFlaggedTasks()
        
        emptyBoxImageView.translatesAutoresizingMaskIntoConstraints = false
        emptyBoxImageView.image = UIImage(named: "emptyBoxImage")
        emptyBoxImageView.contentMode = .scaleAspectFit
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(emptyBoxImageView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            
            emptyBoxImageView.widthAnchor.constraint(equalToConstant: windowWidth/2),
            emptyBoxImageView.heightAnchor.constraint(equalToConstant: windowWidth/2),
            emptyBoxImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyBoxImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
