//
//  SearchTasksVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 06/10/23.
//

import Foundation
import UIKit

extension SearchTasksVC {
    //MARK: setupViews
    func setupViews(){
        title = SetLanguage.setLanguage(.searchTaskTitle)
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.searchTaskTitle)
        
        view.backgroundColor = Constants.mainBackgroundColor
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = Constants.mainBackgroundColor
        searchView.layer.borderColor = Constants.textColor.cgColor
        searchView.layer.borderWidth = 2
        searchView.setCornerRadius(15)
        
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.backgroundColor = .clear
        searchTF.textColor = Constants.textColor
        searchTF.setCornerRadius(15)
        searchTF.delegate = self
        
        let atributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.lightGray
        ]
        
        let attributedPlaceholder = NSAttributedString(string: "        \(SetLanguage.setLanguage(.searchYourTaskPlaceholder))", attributes: atributes)
        
        searchTF.attributedPlaceholder = attributedPlaceholder
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(title: SetLanguage.setLanguage(.done), image: nil, target: self, action: #selector(donePressed(_:)))
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), doneBtn]
        searchTF.inputAccessoryView = toolBar
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        let height = view.frame.height
        
        addSubviews()
        addConstraints(height)
    }
    
    private func addSubviews(){
        view.addSubview(searchView)
        searchView.addSubview(searchTF)
        view.addSubview(tableView)
    }
    
    private func addConstraints(_ height: CGFloat){
        NSLayoutConstraint.activate([
            searchView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            searchView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.12 * height),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            searchView.heightAnchor.constraint(equalToConstant: 50),
            
            searchTF.leftAnchor.constraint(equalTo: searchView.leftAnchor, constant: 3),
            searchTF.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 3),
            searchTF.rightAnchor.constraint(equalTo: searchView.rightAnchor, constant: -3),
            searchTF.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -3),
            
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: searchTF.bottomAnchor, constant: 15),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}
