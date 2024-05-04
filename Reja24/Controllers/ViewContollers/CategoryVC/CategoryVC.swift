//
//  TestVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 03/07/23.
//

import UIKit
import CoreData
import SideMenu

//TODO: - CategoryVC change to AllCategoryVC
class CategoryVC: UIViewController {
    
    //MARK: views
    var collectionView: UICollectionView!
    let backgroundImg = UIImageView()
    
    //MARK: Variables
    var viewModel         = CategoryViewModel()
    var taskViewModel     = TasksViewModel()
    var categoryViewModel = CategoryViewModel()
    var tasks             = [TaskDB]()
    var searchedTasks     = [TaskDB]()
    var searchingIndex    = [Int]()
    let menu              = SideMenuNavigationController(
        rootViewController: SideMenuTV(style: .plain)
    )
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories = [CategoryDB](){
        didSet{
            collectionView.reloadData()
        }
    }
    
    /// if category change, it will notify
//    static var categoryChanged: DataChangedDelegate!
    
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        
        initBaseSettings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        TasksForTodayTVC.role = .today
        NotificationCenter.default.post(name: .categoryChanged, object: nil)
//        not cen use
//        CategoryVC.categoryChanged.categoriesChanged()
    }
    
    //MARK: menuPressed
    @objc func menuPressed(_ sender: Any){
        tasks = taskViewModel.fetchTasks()
        SideMenuTV.userTasksNumber = tasks.count
        setupSideMenu()
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true)
    }
    
    //MARK: setupSideMenu
    func setupSideMenu() {
        SideMenuTV.userTasksNumber = tasks.count
        menu.blurEffectStyle = .systemThinMaterialDark
        menu.setNavigationBarHidden(true, animated: false)
        menu.navigationBar.backgroundColor = .clear
        menu.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    func initBaseSettings(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateCategory(_:)), name: .categoryChanged, object: nil)
        
        categories = categoryViewModel.fetchCategories()
    }
    
    @objc func updateCategory(_ sender: Any){
        self.categories = categoryViewModel.fetchCategories()
        collectionView.reloadData()
    }
    
}


