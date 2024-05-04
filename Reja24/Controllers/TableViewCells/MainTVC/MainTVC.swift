//
//  FolderTVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 13/08/23.
//

import UIKit
import CoreData

class MainTVC: UITableViewCell {
    
    //MARK: Elements
    var collectionView: UICollectionView!
    var layout         = UICollectionViewFlowLayout()
//    var addNewCategory = UIButton()
    var viewAllBtn     = UIButton()
    var headerName     = UILabel()
    let noDataLbl      = UILabel()
    
    //MARK: Variables
    static let identifire: String = String(describing: MainTVC.self)
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories = [CategoryDB]() {
        didSet {
            if categories.count == 0 && typeOfCollection == .category {
                checkIsEmpty!(.category)
            } else {
                noDataLbl.isHidden = true
            }
        }
    }
    var folders = [FolderDB]() {
        didSet {
            if folders.count == 0 && typeOfCollection == .folder {
                checkIsEmpty!(.folder)
            } else {
                noDataLbl.isHidden = true
            }
        }
    }
    var viewModel         = CategoryViewModel()
    var typeOfCollection  : typeOfCollection = .category
    var categoryViewModel = CategoryViewModel()
    var folderViewModel   = FolderViewModel()
    var checkIsEmpty      : ( (typeOfCollection) -> Void )?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        categoryViewModel.updateCategories = self
        
//        CreateNewCategory.categoryChanged = self // TODO:  shuni o`rniga not cen
        NotificationCenter.default.addObserver(
            self, selector: #selector(updateCategories(_:)) , name: .categoryChanged, object: nil
        )
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(updateFolders(_:)) , name: .folderChanged, object: nil
        )
        
        categories = categoryViewModel.fetchCategories()
        folders = folderViewModel.fetchFolders()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    //MARK: seeAllCategories
    @objc func seeAllCategories(_ sender: Any){
        if typeOfCollection == .category {
            openVcDelegate.openAllCategoriesVC()
        } else {
            openVcDelegate.openAllFoldersVC()
        }
    }
    
    @objc func updateCategories(_ sender: UIButton) {
        self.categories = categoryViewModel.fetchCategories()
        self.collectionView.reloadData()
    }
    
    @objc func updateFolders(_ sender: UIButton) {
        self.folders = folderViewModel.fetchFolders()
        self.collectionView.reloadData()
    }
    
    
    //MARK: setupItemSize
    func setupItemSize(){
        if typeOfCollection == .category {
            //TODO: - test
            layout.itemSize = CGSize(
                width: windowWidth * 0.75,
                height: windowWidth * 0.4
            )
        } else if typeOfCollection == .folder {
            layout.itemSize = CGSize(
                width: windowWidth * 0.33,
                height: windowWidth * 0.3
            )
        }

    }
}

