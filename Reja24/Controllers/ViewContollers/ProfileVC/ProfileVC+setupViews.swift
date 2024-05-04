//
//  ProfileVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 01/09/23.
//

import Foundation
import UIKit

extension ProfileVC {
    //MARK: setupViews
    func setupViews(){
        
        view.backgroundColor = Constants.mainBackgroundColor
        
        addSubviews()
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .primaryAppColor
        topView.frame = CGRect(
            x: -50,
            y: -((windowWidth+150)/2),
            width: windowWidth+100,
            height: windowWidth+100
        )
        topView.layer.cornerRadius = (windowWidth+100)/2
        
        userImg.translatesAutoresizingMaskIntoConstraints = false
        userImg.tintColor = .brown
        userImg.clipsToBounds = true
        userImg.image = UIImage(named: "add_user_image")
        let imgTapped = UITapGestureRecognizer(target: self, action: #selector(selectPhoto(_:)))
        imgTapped.numberOfTapsRequired = 1
        userImg.isUserInteractionEnabled = true
        userImg.addGestureRecognizer(imgTapped)
        
        firstNameTF.translatesAutoresizingMaskIntoConstraints = false
        firstNameTF.placeholder = SetLanguage.setLanguage(.firstNamePlaceholder)
        firstNameTF.borderStyle = .roundedRect
        firstNameTF.layer.cornerRadius = 10
        firstNameTF.layer.borderWidth = 1.0
        firstNameTF.backgroundColor = UIColor(hex: "#B6C2CF")
        firstNameTF.layer.borderColor = UIColor.gray.cgColor
        firstNameTF.clipsToBounds = true
        
        let toolBarDone = UIToolbar()
        toolBarDone.sizeToFit()
        let btnDone = UIBarButtonItem(title: SetLanguage.setLanguage(.done), image: nil, target: self, action: #selector(doneTF(_:)))
        toolBarDone.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), btnDone]
        firstNameTF.inputAccessoryView = toolBarDone
        
        secondNameTF.translatesAutoresizingMaskIntoConstraints = false
        secondNameTF.placeholder = SetLanguage.setLanguage(.lastNamePlaceholder)
        secondNameTF.borderStyle = .roundedRect
        secondNameTF.layer.cornerRadius = 10
        secondNameTF.layer.borderWidth = 1.0
        secondNameTF.backgroundColor = UIColor(hex: "#B6C2CF")
        secondNameTF.layer.borderColor = UIColor.gray.cgColor
        secondNameTF.clipsToBounds = true
        
        let toolBarNext = UIToolbar()
        toolBarNext.sizeToFit()
        let btnNext = UIBarButtonItem(title: SetLanguage.setLanguage(.nextBtn), image: nil, target: self, action: #selector(nextTF(_:)))
        
        toolBarNext.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), btnNext]
        secondNameTF.inputAccessoryView = toolBarNext

        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.setTitle(SetLanguage.setLanguage(.save), for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.titleLabel?.font = UIFont(name: Constants.appFont, size: 19)
        saveBtn.backgroundColor = .primaryAppColor
        //#colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1)
        saveBtn.layer.cornerRadius = 7
        saveBtn.clipsToBounds = true
        saveBtn.addTarget(self, action: #selector(savePressed(_:)), for: .touchUpInside)
        
        addConstraints()
    }

    //MARK: addSubviews
    private func addSubviews(){
        view.addSubview(topView)
        view.addSubview(userImg)
        view.addSubview(firstNameTF)
        view.addSubview(secondNameTF)
        view.addSubview(saveBtn)
    }
    
    //MARK: addConstraints
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            userImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            userImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 100),
            userImg.widthAnchor.constraint(equalToConstant: 100),
            
            firstNameTF.topAnchor.constraint(equalTo: secondNameTF.bottomAnchor, constant: 25),
            firstNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            firstNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            firstNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            secondNameTF.topAnchor.constraint(equalTo: userImg.bottomAnchor, constant: 33),
            secondNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            secondNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            secondNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            saveBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -33),
            saveBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11),
            saveBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11),
            saveBtn.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
}
