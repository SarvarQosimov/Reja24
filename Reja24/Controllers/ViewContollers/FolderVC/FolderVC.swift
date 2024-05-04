//
//  FolderVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import UIKit
import CoreData

class FolderVC: UIViewController {

    //MARK: Elements
    var collectionView: UICollectionView!
    var layout = UICollectionViewFlowLayout()
    var addBtn = UIButton()
    var customBackBtn = UIBarButtonItem()
    var cancleBtn = UIBarButtonItem()
    var removeCategoryFromFolderBtn = UIBarButtonItem()
    
    //MARK: Variables
    static var whichFolder       : Int!
    var viewModel                = CategoryViewModel()
    var categories               = [CategoryDB]()
    var selectedIndexs           = [Int]()
    var isRemoving               = false
    var removingCategoriesIndexs = [Int]()
    var workerCategories       = [CategoryDB]() {
        didSet {
            if workerCategories.count == 0 {
                removeCategoryFromFolderBtn.isHidden = true
            } else {
                removeCategoryFromFolderBtn.isHidden = false
            }
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = viewModel.fetchCategories()
        setupViews()
        sortByFolder()
        setupTableView()
    }
    
    //MARK: removeCategoryFromFolderPressed
    @objc func removeCategoryFromFolderPressed(_ sender: Any){
        if !isRemoving {
            removeCategoryFromFolderBtn.image = nil
            
            removeCategoryFromFolderBtn.title = SetLanguage.setLanguage(.delete)
            customBackBtn.isHidden = true
            cancleBtn.isHidden = false
            isRemoving = true
            collectionView.reloadData()
        } else {
            if removingCategoriesIndexs.count != 0 {
                alertToDeleteCategories()
            }
        }
    }
  
    //MARK: backBtnPressed
    @objc func backBtnPressed(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissWithSwipeGesture(_ gesture: UISwipeGestureRecognizer){
        let xLocation = gesture.location(in: view).x
        
        if xLocation < 35 {
            navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: cancelPressed
    @objc func cancelPressed(_ sender: Any){
        isRemoving = false
        cancleBtn.isHidden = true
        customBackBtn.isHidden = false
        removeCategoryFromFolderBtn.title = ""
        removeCategoryFromFolderBtn.image = UIImage(systemName: "minus.circle")
        removingCategoriesIndexs.removeAll()
        collectionView.reloadData()
    }
    
    //MARK: addBtnPressed
    @objc func addBtnPressed(_ sender: Any){
        
        guard categories.count > 0 else {
            let alert = Alert.makeAlertController(SetLanguage.setLanguage(.noAnyCategory))
            present(alert, animated: true)
            return
        }
        
        let vc = ChooseCategoriesVC()
        var userOptions = [CategoryDB]()
        for i in categories.enumerated() {
            if !selectedIndexs.contains(i.offset) {
                userOptions.append(i.element)
            }
        }
        vc.options = userOptions
        vc.delegate = self
        present(vc, animated: true)
    }
    
    //MARK: sortByFolder
    func sortByFolder(){
        workerCategories = []
        selectedIndexs = []
        for i in categories.enumerated() {
            for _id in i.element.id! {
                if "\(_id)" == "\(FolderVC.whichFolder!)" {
                    workerCategories.append(i.element)
                    selectedIndexs.append(i.offset)
                    break
                }
            }
        }
        collectionView.reloadData()
    }
    
    //MARK: alertToDeleteCategories
    func alertToDeleteCategories(){
        let alert = UIAlertController(title: nil, message: SetLanguage.setLanguage(.warningMessage), preferredStyle: .alert)
        let action1 = UIAlertAction(title: SetLanguage.setLanguage(.delete), style: .destructive) { [self] deleteAction in
            
            for i in removingCategoriesIndexs {
                workerCategories[i].id = removeFromFolder(workerCategories[i].id!)
            }
            
            sortByFolder()
            
            isRemoving = false
            cancleBtn.isHidden = true
            customBackBtn.isHidden = false
            removingCategoriesIndexs.removeAll()
            removeCategoryFromFolderBtn.title = ""
            removeCategoryFromFolderBtn.image = UIImage(systemName: "minus.circle")
            collectionView.reloadData()
        }
        let action2 = UIAlertAction(title: SetLanguage.setLanguage(.cancelBtn), style: .cancel)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true)
    }
    
    func removeFromFolder(_ id: String) -> String {
        var newID = ""
        for i in id where "\(i)" != "\(FolderVC.whichFolder!)" {
            newID.append(i)
        }
        
        return newID
    }
    
}
