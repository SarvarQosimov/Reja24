//
//  AddTaskVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/08/23.
//

import Foundation
import UIKit

extension AddTaskVC {
    //MARK: setupViews
    func setupViews(){
        
        addSubviews(taskTF, noteTextView, priorityLbl, flagImgBtn, stack, addToListBtn, addImgBtn, selectedImsge)
        
        miniView.backgroundColor = Constants.mainBackgroundColor//backgroundColorForMiniView
        miniView.translatesAutoresizingMaskIntoConstraints = false
        miniView.layer.cornerRadius = 30
        miniView.clipsToBounds = true
        miniView.layer.borderColor = UIColor.primaryAppColor.cgColor//Constants.textColor.cgColor
        miniView.layer.borderWidth = 3
        
        let blurEffectView = UIVisualEffectView(effect: blur)
        view.addSubview(blurEffectView)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.75
        view.addSubview(miniView)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissAreaPressed(_:)))
        gesture.numberOfTapsRequired = 1
        blurEffectView.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        blurEffectView.addGestureRecognizer(gesture)
        
        let toolBar1 = UIToolbar()
        toolBar1.sizeToFit()
        let doneBtn1 = UIBarButtonItem(title: SetLanguage.setLanguage(.done), image: nil, target: self, action: #selector(doneTF(_:)))
        toolBar1.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), doneBtn1]
        taskTF.inputAccessoryView = toolBar1
        
        taskTF.translatesAutoresizingMaskIntoConstraints = false
        taskTF.textColor = Constants.textColor
        taskTF.borderStyle = .none
        
        let atributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.lightGray
        ]
        
        let attributedPlaceholder = NSAttributedString(string: SetLanguage.setLanguage(.nameOfNewTask), attributes: atributes)
        
        taskTF.attributedPlaceholder = attributedPlaceholder
        
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.layer.borderColor = UIColor.lightGray.cgColor//Constants.textColor.cgColor
        noteTextView.backgroundColor = Constants.backgroundColorForMiniView
        noteTextView.textColor = Constants.textColor
        noteTextView.layer.borderWidth = 2
        noteTextView.layer.cornerRadius = 10
        noteTextView.font = .italicSystemFont(ofSize: 17)
        noteTextView.clipsToBounds = true
        noteTextView.delegate = self
        
        let toolBar2 = UIToolbar()
        toolBar2.sizeToFit()
        let doneBtn2 = UIBarButtonItem(title: SetLanguage.setLanguage(.done), image: nil, target: self, action: #selector(doneTextView(_:)))
        toolBar2.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), doneBtn2]
        noteTextView.inputAccessoryView = toolBar2
        
        placeholderForTextView.translatesAutoresizingMaskIntoConstraints = false
        placeholderForTextView.text = "\(SetLanguage.setLanguage(.note))..."
        placeholderForTextView.textColor = .lightGray
        placeholderForTextView.font = .monospacedDigitSystemFont(ofSize: 17, weight: .semibold)
        
        priorityLbl.translatesAutoresizingMaskIntoConstraints = false
        priorityLbl.text = SetLanguage.setLanguage(.selectPriority)
        priorityLbl.font = UIFont(name: Constants.appFont, size: 19) // font black edi
        priorityLbl.textColor = Constants.textColor
        
        flagImgBtn.translatesAutoresizingMaskIntoConstraints = false
        flagImgBtn.setImage(UIImage(systemName: "flag"), for: .normal)
        flagImgBtn.tintColor = .orange
        flagImgBtn.addTarget(self, action: #selector(flagPressed(_:)), for: .touchUpInside)
        
        addToListBtn.translatesAutoresizingMaskIntoConstraints = false
        addToListBtn.setImage(UIImage(systemName: "arrow.right.circle"), for: .normal)
        addToListBtn.tintColor = .primaryAppColor//Constants.textColor
        
        addToListBtn.setTitleColor(.white, for: .normal)
        addToListBtn.layer.cornerRadius = 5
        addToListBtn.clipsToBounds = true
        addToListBtn.addTarget(self, action: #selector(addToListPressed(_:)), for: .touchUpInside)
        
        addImgBtn.translatesAutoresizingMaskIntoConstraints = false
        addImgBtn.setImage(UIImage(systemName: "paperclip"), for: .normal)
        addImgBtn.addTarget(self, action: #selector(selectPhoto(_:)), for: .touchUpInside)
        
        selectedImsge.translatesAutoresizingMaskIntoConstraints = false
        selectedImsge.layer.cornerRadius = 5
        selectedImsge.clipsToBounds = true
        
        setupPriorityBtn()
        addConstraints()
        
        if AddTaskVC.isEditing.0 {
            setEdit()
        }
    }
    
    //MARK: setupPriorityBtn
    func setupPriorityBtn(){
        var cnt = 0
        for _ in 0...2 {
            let btn = UIButton()
            btn.tag = cnt
            btn.setTitleColor(Constants.textColor, for: .normal)
            btn.titleLabel?.font = UIFont(name: Constants.appFont + " Semibold", size: 21)
            btn.layer.borderWidth = 3
            btn.layer.cornerRadius = 13
            btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
            btn.addTarget(self, action: #selector(priorityBtn(_:)), for: .touchUpInside)
            
            switch cnt {
            case 0:
                btn.setTitle(SetLanguage.setLanguage(.high), for: .normal)
                btn.layer.borderColor = UIColor.red.cgColor
            case 1:
                btn.setTitle(SetLanguage.setLanguage(.medium), for: .normal)
                btn.layer.borderColor = UIColor.systemYellow.cgColor
            default:
                btn.setTitle(SetLanguage.setLanguage(.low), for: .normal)
                btn.layer.borderColor = UIColor.systemGreen.cgColor
            }
            
            stack.addArrangedSubview(btn)
            priorityButtons.append(btn)
            
            cnt += 1
        }
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
    }

    private func addSubviews(_ views: UIView...){
        view.addSubview(miniView)
        
        noteTextView.addSubview(placeholderForTextView)
        
        views.forEach { element in
            miniView.addSubview(element)
        }
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
//            miniView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            miniView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 33),
            miniView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33),
            miniView.heightAnchor.constraint(equalToConstant: 400),
            miniView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150), // yoki 200
            
            selectedImsge.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 20),
            selectedImsge.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 9),
            selectedImsge.heightAnchor.constraint(equalToConstant: 30),
            selectedImsge.widthAnchor.constraint(equalToConstant: 30),
            
            taskTF.leftAnchor.constraint(equalTo: selectedImsge.rightAnchor, constant: 5),
            taskTF.centerYAnchor.constraint(equalTo: selectedImsge.centerYAnchor),
            taskTF.rightAnchor.constraint(equalTo: addImgBtn.leftAnchor, constant: -5),
            taskTF.heightAnchor.constraint(equalToConstant: 50),
            
            addImgBtn.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -3),
            addImgBtn.topAnchor.constraint(equalTo: selectedImsge.topAnchor, constant: 0),
            addImgBtn.heightAnchor.constraint(equalToConstant: 50),
            addImgBtn.widthAnchor.constraint(equalToConstant: 50),
            
            noteTextView.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 15),
            noteTextView.topAnchor.constraint(equalTo: taskTF.bottomAnchor, constant: 10),
            noteTextView.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -15),
            noteTextView.heightAnchor.constraint(equalToConstant: 75),
            
            placeholderForTextView.centerXAnchor.constraint(equalTo: noteTextView.centerXAnchor),
            placeholderForTextView.centerYAnchor.constraint(equalTo: noteTextView.centerYAnchor),
        
            priorityLbl.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 25),
            priorityLbl.topAnchor.constraint(equalTo: noteTextView.bottomAnchor, constant: 15),
            
            flagImgBtn.topAnchor.constraint(equalTo: priorityLbl.topAnchor, constant: 0),
            flagImgBtn.rightAnchor.constraint(equalTo: noteTextView.rightAnchor, constant: 0),
            
            stack.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 25),
            stack.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -25),
            stack.topAnchor.constraint(equalTo: priorityLbl.bottomAnchor, constant: 15),
            
            addToListBtn.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -15),
            addToListBtn.bottomAnchor.constraint(equalTo: miniView.bottomAnchor, constant: -15),
            addToListBtn.widthAnchor.constraint(equalToConstant: 45),
            addToListBtn.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        if let addButtonImage = addToListBtn.imageView {
            addButtonImage.translatesAutoresizingMaskIntoConstraints = false
            addButtonImage.widthAnchor.constraint(equalToConstant: 45).isActive = true
            addButtonImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        }
        
    }
    
}
