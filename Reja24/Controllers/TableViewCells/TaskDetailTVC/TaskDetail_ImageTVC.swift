//
//  TaskDetail_Image.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import UIKit

class TaskDetail_ImageTVC: TaskDetailBaseTVC {
    
    private let taskImageView = UIImageView()
    var taskImage: UIImage
    
    init(taskImage: UIImage) {
        self.taskImage = taskImage
        super.init()
        
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews(){
        containerView.addSubview(taskImageView)
        taskImageView.translatesAutoresizingMaskIntoConstraints = false
        taskImageView.contentMode = .scaleToFill
        taskImageView.setCornerRadius()
        taskImageView.image = taskImage
        
        let imageSize = windowWidth - 50
        
        NSLayoutConstraint.activate([
            taskImageView.widthAnchor.constraint(equalToConstant: imageSize),
            taskImageView.heightAnchor.constraint(equalToConstant: imageSize),
            taskImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            taskImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            taskImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        ])
    }
    
    
}
