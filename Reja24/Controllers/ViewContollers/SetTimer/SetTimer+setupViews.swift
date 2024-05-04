//
//  SetTimer+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 30/08/23.
//

import Foundation
import UIKit

extension SetTimer {
    //MARK: setupViews
    func setupViews(){
        
        addSubviews(datePicker, setBtn, cancelBtn)
        
        dismisAreaButton.translatesAutoresizingMaskIntoConstraints = false
        dismisAreaButton.backgroundColor = .clear
        dismisAreaButton.addTarget(
            self, action: #selector(cancelPresssed(_:)), for: .touchUpInside
        )
  
        
        view.backgroundColor = .clear
        miniView.translatesAutoresizingMaskIntoConstraints = false
        miniView.backgroundColor = Constants.mainBackgroundColor//Constants.backgroundColorForMiniView
        miniView.layer.maskedCorners = CACornerMask([.layerMinXMinYCorner, .layerMaxXMinYCorner])
        miniView.layer.cornerRadius = 25
        miniView.clipsToBounds = true
        miniView.layer.borderColor = UIColor.primaryAppColor.cgColor
        miniView.layer.borderWidth = 1
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.setImage(UIImage(named: "close_icon"), for: .normal)
        cancelBtn.backgroundColor = .clear
        cancelBtn.addTarget(self, action: #selector(cancelPresssed(_:)), for: .touchUpInside)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.backgroundColor = .systemGray4
        datePicker.layer.cornerRadius = 5
        datePicker.clipsToBounds = true
        
        setBtn.translatesAutoresizingMaskIntoConstraints = false
        setBtn.setTitle(SetLanguage.setLanguage(.setBtn), for: .normal)
        setBtn.setTitleColor(Constants.textColor, for: .normal)
        setBtn.titleLabel?.font = UIFont(name: Constants.appFont + " Semibold", size: 21)
        setBtn.addTarget(self, action: #selector(setPressed(_:)), for: .touchUpInside)
       
        
        addConstraints()
    }
    
    private func addSubviews(_ views: UIView...){
        view.addSubview(dismisAreaButton)
        view.addSubview(miniView)
        
        views.forEach { element in
            miniView.addSubview(element)
        }
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            dismisAreaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dismisAreaButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismisAreaButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            dismisAreaButton.bottomAnchor.constraint(equalTo: miniView.topAnchor),
            
            miniView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            miniView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            miniView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            miniView.heightAnchor.constraint(equalToConstant: 150),
            
            datePicker.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -10),
            datePicker.bottomAnchor.constraint(equalTo: setBtn.topAnchor, constant: -5),
            
            setBtn.centerXAnchor.constraint(equalTo: miniView.centerXAnchor),
            setBtn.bottomAnchor.constraint(equalTo: miniView.bottomAnchor, constant: -20),
            
            cancelBtn.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 10),
            cancelBtn.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 10),
            cancelBtn.widthAnchor.constraint(equalToConstant: 25),
            cancelBtn.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
}
