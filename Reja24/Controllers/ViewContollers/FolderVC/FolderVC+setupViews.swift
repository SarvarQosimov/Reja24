//
//  FolderVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import Foundation
import UIKit

extension FolderVC {
    func setupViews(){
        let swipeGesture = UISwipeGestureRecognizer(
            target: self, action: #selector(dismissWithSwipeGesture(_:))
        )
        swipeGesture.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeGesture)
        
        view.backgroundColor = Constants.mainBackgroundColor
        
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 25
        layout.scrollDirection = .vertical
        
        removeCategoryFromFolderBtn = UIBarButtonItem(
            image: UIImage(systemName: "minus.circle"),
            style: .done,
            target: self,
            action: #selector(removeCategoryFromFolderPressed(_:))
        )
        removeCategoryFromFolderBtn.tintColor = .red
        
        let customFont = UIFont(name: Constants.appFont, size: 17)
        let attributedString: [NSAttributedString.Key : Any] = [
            .font : customFont ?? .systemFont(ofSize: 15)
        ]
        
        removeCategoryFromFolderBtn.setTitleTextAttributes(attributedString, for: .normal)
        navigationItem.rightBarButtonItem = removeCategoryFromFolderBtn
        
        if workerCategories.count == 0 {
            removeCategoryFromFolderBtn.isHidden = true
        } else {
            removeCategoryFromFolderBtn.isHidden = false
        }
        
        customBackBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(backBtnPressed(_:)))
        customBackBtn.tintColor = .primaryAppColor
        
        cancleBtn = UIBarButtonItem(
            title: SetLanguage.setLanguage(.cancelBtn),
            style: .done,
            target: self,
            action: #selector(cancelPressed(_:))
        )
        cancleBtn.tintColor = .systemBlue
        cancleBtn.isHidden = true
        
        cancleBtn.setTitleTextAttributes(attributedString, for: .normal)
        navigationItem.leftBarButtonItems = [customBackBtn, cancleBtn]
        
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout
        )
        addSubviews()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.titleLabel?.font = UIFont(name: Constants.appFont, size: 17)
        addBtn.setTitle(SetLanguage.setLanguage(.addCategoriesBtn), for: .normal)
        addBtn.setTitleColor(.white, for: .normal)
        addBtn.backgroundColor = .primaryAppColor
        addBtn.layer.cornerRadius = 5
        addBtn.clipsToBounds = true
        addBtn.addTarget(self, action: #selector(addBtnPressed(_:)), for: .touchUpInside)
        
        addConstrents()
    }
    
    private func addSubviews(){
        view.addSubview(collectionView)
        view.addSubview(addBtn)
    }
    
    private func addConstrents(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            
            addBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            addBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            addBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            addBtn.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}
