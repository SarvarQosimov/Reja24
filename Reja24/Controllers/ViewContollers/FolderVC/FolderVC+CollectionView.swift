//
//  FolderVC+CollectionView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import Foundation
import UIKit

extension FolderVC {
    func setupTableView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCVC.self, forCellWithReuseIdentifier: CategoryCVC.identifier)
    }
}

//MARK: UICollectionViewDataSource
extension FolderVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        workerCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else { return UICollectionViewCell() }
        
        let currentCell = workerCategories[indexPath.item]
        let isSelected = removingCategoriesIndexs.contains(indexPath.row)
        
        cell.updateCell(
            name : currentCell.nameCategory ?? "Unnamed",
            color : currentCell.colorCategory ?? "",
            isFavourity : currentCell.isFavourity,
            isSelectAble: isRemoving,
            isSelected: isSelected
        )
        
        return cell
        
    }
    
}

//MARK: UICollectionViewDelegate
extension FolderVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
        if isRemoving {
            if removingCategoriesIndexs.contains(indexPath.row) {
                for i in removingCategoriesIndexs.enumerated() where i.element == indexPath.row{
                        removingCategoriesIndexs.remove(at: i.offset)
                        break
                 }
            } else {
                removingCategoriesIndexs.append(indexPath.item)
            }
            
            collectionView.reloadData()
        } else {
            let vc = TasksVC()
            let which = selectedIndexs[indexPath.item]
            TasksVC.whichCategory = which
            TasksVC.titleOfCategory = categories[which].nameCategory ?? "Unnamed"
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension FolderVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}
