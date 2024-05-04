//
//  Tabbar.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/07/23.
//

import UIKit

class Tabbar: UITabBarController {
    
    let vc1 = MainVC()
    let vc2 = FlaggedTasksVC()
    
    let centerButton = UIButton()
    
    private var shapeLayer: CALayer?
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { [weak self] in
            guard let self = self else { return }
            
            setupTabbar()
            addPlusButton()
        }
    }
    
    @objc func centerButtonTapped(_ sender: UIButton) {
        let maxBottom = tabBar.frame.height
        
        let newTemplateView = CreateNewTemplate(maxBottom)
        
        newTemplateView.modalPresentationStyle = .overFullScreen
        present(newTemplateView, animated: true)
    }
    
    //MARK: setupTabbar
    func setupTabbar(){
        tabBar.backgroundColor = Constants.mainBackgroundColor
        tabBar.selectedImageTintColor = Constants.selectedTabbarColor
        tabBar.unselectedItemTintColor = Constants.unselectedTabbarColor
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let item1 = UITabBarItem(
            title: SetLanguage.setLanguage(.homeTitle),
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        vc1.tabBarItem = item1
        
        let nc2 = UINavigationController(rootViewController: vc2)
        let item2 = UITabBarItem(
            title: SetLanguage.setLanguage(.flaggedTitle),
            image: UIImage(systemName: "flag"),
            selectedImage: UIImage(systemName: "flag.fill")
        )
        
        vc2.tabBarItem = item2
        
        viewControllers = [nc1, nc2]
    }
    
    private func addPlusButton(){
        centerButton.setImage(UIImage(named: "plus_button"), for: .normal)
        centerButton.backgroundColor = .primaryAppColor.withAlphaComponent(0.25)
        centerButton.layer.cornerRadius = 22
        centerButton.clipsToBounds = true
        centerButton.addTarget(self, action: #selector(centerButtonTapped(_:)), for: .touchUpInside)
        
        centerButton.tag = 571
        
        tabBar.addSubview(centerButton)
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            centerButton.topAnchor.constraint(equalTo: tabBar.topAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: 45),
            centerButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
}

