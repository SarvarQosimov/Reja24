//
//  TaskDetailBaseTVC.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import UIKit

class TaskDetailBaseTVC: UITableViewCell {
    
    let containerView = UIView()
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        
        initBaseViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initBaseViews(){
        contentView.backgroundColor = .primaryAppColor
        
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9176470588, alpha: 1) // DEE4EA
        containerView.setCornerRadius()
        
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
        ])
    }
    
}
