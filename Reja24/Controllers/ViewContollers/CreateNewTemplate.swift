//
//  CreateNewTemplate.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 29/04/24.
//

import UIKit

class CreateNewTemplate: UIViewController {
    
    //MARK: - views
    let newCategoryButton = UIButton()
    let newFolderButton = UIButton()
    
    let categoryImage = UIImageView()
    let categoryTitle = UILabel()
    
    let folderImage = UIImageView()
    let folderTitle = UILabel()
    
    //MARK: - variables
    var maxBottom: CGFloat
    
    init(_ maxBottom: CGFloat) {
        self.maxBottom = maxBottom
        super.init(nibName: nil, bundle: nil)
        
        initViews_test()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews_test(){
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 0)
        
        let dismisGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPressed(_:)))
        dismisGesture.numberOfTapsRequired = 1
        view.gestureRecognizers = [dismisGesture]
        
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.image = UIImage(named: "new_category_icon")
        categoryImage.contentMode = .scaleAspectFit
        
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        categoryTitle.text = SetLanguage.setLanguage(.newCategory)
        categoryTitle.font = UIFont(name: Constants.appFont, size: 15)
        
        folderImage.translatesAutoresizingMaskIntoConstraints = false
        folderImage.image = UIImage(named: "folder")
        folderImage.contentMode = .scaleAspectFit
        
        folderTitle.translatesAutoresizingMaskIntoConstraints = false
        folderTitle.text = SetLanguage.setLanguage(.newFolder)
        folderTitle.font = UIFont(name: Constants.appFont, size: 15)
        
        let stackView1 = UIStackView()
        view.addSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .horizontal
        stackView1.spacing = 11
        stackView1.backgroundColor = #colorLiteral(red: 0.7137254902, green: 0.7607843137, blue: 0.8117647059, alpha: 1)
        stackView1.layer.cornerRadius = 7
        stackView1.clipsToBounds = true
        stackView1.tag = 0
        stackView1.addArrangedSubview(UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25)))
        stackView1.addArrangedSubview(categoryImage)
        stackView1.addArrangedSubview(categoryTitle)
        stackView1.addArrangedSubview(UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25)))

        
        let category_tapGesture = UITapGestureRecognizer(target: self, action: #selector(templatePressed(_:)))
        category_tapGesture.numberOfTapsRequired = 1
        stackView1.gestureRecognizers = [category_tapGesture]
        
        let stackView2 = UIStackView()
        view.addSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal
        stackView2.spacing = 11
        stackView2.backgroundColor = #colorLiteral(red: 0.7137254902, green: 0.7607843137, blue: 0.8117647059, alpha: 1)
        stackView2.layer.cornerRadius = 7
        stackView2.clipsToBounds = true
        stackView2.tag = 1
        stackView2.addArrangedSubview(UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25)))
        stackView2.addArrangedSubview(folderImage)
        stackView2.addArrangedSubview(folderTitle)
        stackView2.addArrangedSubview(UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25)))
        
        let folder_tapGesture = UITapGestureRecognizer(target: self, action: #selector(templatePressed(_:)))
        folder_tapGesture.numberOfTapsRequired = 1
        stackView2.gestureRecognizers = [folder_tapGesture]
        
        let cancelButton = UIButton()
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setImage(UIImage(named: "close_icon"), for: .normal)
        cancelButton.addTarget(self, action: #selector(dismissPressed(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            categoryImage.widthAnchor.constraint(equalToConstant: 21),
            categoryImage.heightAnchor.constraint(equalToConstant: 21),
            
            folderImage.widthAnchor.constraint(equalToConstant: 21),
            folderImage.heightAnchor.constraint(equalToConstant: 21),
            
            stackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView1.heightAnchor.constraint(equalToConstant: 39),
            stackView1.bottomAnchor.constraint(equalTo: stackView2.topAnchor, constant: -15),
            
            stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView2.heightAnchor.constraint(equalToConstant: 39),
            stackView2.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -11),
            
            cancelButton.widthAnchor.constraint(equalToConstant: 25),
            cancelButton.heightAnchor.constraint(equalToConstant: 25),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(maxBottom+15))
        ])
        
    }
    
    @objc func templatePressed(_ sender: UITapGestureRecognizer){
            if sender.view?.tag == 0 {
                dismiss(animated: true) {
                    NotificationCenter.default.post(
                        name: .createNewTemplate, object: nil, userInfo: [Constants.TEMPLATE_TYPE_KEY: TemplateType.category]
                    )
                }
            } else {
                dismiss(animated: true) {
                    NotificationCenter.default.post(
                        name: .createNewTemplate, 
                        object: nil,
                        userInfo: [Constants.TEMPLATE_TYPE_KEY: TemplateType.folder]
                    )
                }
            }
    }
    
    @objc func dismissPressed(_ sender: UITapGestureRecognizer){
        dismiss(animated: false)
    }
    
}
