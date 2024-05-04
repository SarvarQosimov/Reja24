//
//  FolderCVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 05/10/23.
//

import Foundation
import UIKit

extension FolderCVC {
    //MARK: setupViews
    func setupViews(){
        contentView.backgroundColor = .clear
        
        addSubviews()
        
        /*      folderName      */
        folderName.translatesAutoresizingMaskIntoConstraints = false
        folderName.font = UIFont(name: Constants.appFont, size: 15)
        folderName.numberOfLines = 2
        folderName.textColor = Constants.textColor
        folderName.textAlignment = .left
        folderName.lineBreakMode = .byCharWrapping
        
        /*       folderImg     */
        folderImg.translatesAutoresizingMaskIntoConstraints = false
        folderImg.image = UIImage(named: "folder")
        folderImg.contentMode = .scaleAspectFill
        
        addConstraints()
    }
    
    //MARK: addSubviews
    private func addSubviews(){
        contentView.addSubview(folderName)
        contentView.addSubview(folderImg)
    }
    
    //MARK: addConstraints
    private func addConstraints(){
        NSLayoutConstraint.activate([
            folderName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            folderName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            folderName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -3),
            folderName.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 5),
            
            folderImg.widthAnchor.constraint(equalToConstant: 85),
            folderImg.heightAnchor.constraint(equalToConstant: 45),
            folderImg.topAnchor.constraint(equalTo: folderName.bottomAnchor, constant: 15),
//            folderImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//            folderImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            folderImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7)
        ])
    }

}
