//
//  CategoryCell.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/07/23.
//

import UIKit

class CategoryCVC: UICollectionViewCell { 
    
    //MARK: Elements
    var categoryNameLbl     = UILabel()
    var selectedCategoryImg = UIImageView()
    var favourityBtn        = UIButton()
    
    static let identifier: String = String(describing: CategoryCVC.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: updateCell
    func updateCell(name: String, color: String, isFavourity: Bool, isSelectAble: Bool, isSelected: Bool = false){
        let backColor = UIColor(hex: color)
        contentView.backgroundColor =  Constants.mainBackgroundColor
        
        if isSelectAble {
            selectedCategoryImg.isHidden = false
            
            if isSelected {
                selectedCategoryImg.image = UIImage(
                    systemName: "checkmark",
                    withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
                )
                
                
            } else {
                selectedCategoryImg.image = UIImage(
                    systemName: "circle",
                    withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
                )
            }
            
        } else {
            selectedCategoryImg.isHidden = true
        }
        
        contentView.layer.borderColor = UIColor.init(hex: color)?.cgColor
        contentView.layer.borderWidth = 3
        
        if isFavourity {
            favourityBtn.isHidden = false
        } else {
            favourityBtn.isHidden = true
        }
        
        categoryNameLbl.text = name
    }
}
