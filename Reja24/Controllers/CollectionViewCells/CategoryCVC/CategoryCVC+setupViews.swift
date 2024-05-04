//
//  CategoryCVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 07/10/23.
//

import Foundation
import UIKit

extension CategoryCVC {
    //MARK: setupViews
    func setupViews(){
        contentView.layer.cornerRadius = 25
        contentView.clipsToBounds = true
        
        addSubviews()
        
        categoryNameLbl.textColor = Constants.textColor//.brown
        categoryNameLbl.font = UIFont(name: Constants.appFont, size: 19)
        categoryNameLbl.numberOfLines = 0
        categoryNameLbl.textAlignment = .center
        categoryNameLbl.translatesAutoresizingMaskIntoConstraints = false
        categoryNameLbl.lineBreakMode = .byCharWrapping
        
        var favourityImage = UIImage(
            named: "bookmark_darkMode"
        )
        
        if UserDefaults.standard.string(forKey: Constants.appMode) == "light" {
            favourityImage = UIImage(named: "bookmark_lightMode")
        }
        
        favourityBtn.translatesAutoresizingMaskIntoConstraints = false
        favourityBtn.setImage(favourityImage, for: .normal)
        favourityBtn.tintColor = .blue
        
        selectedCategoryImg.translatesAutoresizingMaskIntoConstraints = false
        selectedCategoryImg.image = UIImage(
            systemName: "circle",
            withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
        )
        selectedCategoryImg.isHidden = true
        selectedCategoryImg.tintColor = .primaryAppColor
        
        
        addConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(categoryNameLbl)
        contentView.addSubview(favourityBtn)
        contentView.addSubview(selectedCategoryImg)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            categoryNameLbl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -9),
            categoryNameLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 9),
            categoryNameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            categoryNameLbl.bottomAnchor.constraint(equalTo: favourityBtn.topAnchor, constant: -3),
            
            favourityBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -9),
            favourityBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            favourityBtn.heightAnchor.constraint(equalToConstant: 21),
            favourityBtn.widthAnchor.constraint(equalToConstant: 21),
            
            selectedCategoryImg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            selectedCategoryImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
}
