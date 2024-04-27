//
//  ChooseLanguageVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 03/10/23.
//

import Foundation
import UIKit

extension ChooseLanguageVC {
    func setupViews(){
        view.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        
        addSubviews()
        
        miniView.isUserInteractionEnabled = true
        miniImage.translatesAutoresizingMaskIntoConstraints = false
        miniImage.image = UIImage(named: "imageForChooseLanguage")
        
        miniView.translatesAutoresizingMaskIntoConstraints = false
        miniView.layer.cornerRadius = 11
        miniView.clipsToBounds = true
        miniView.backgroundColor = .white
        
        chooseLanguageLbl.translatesAutoresizingMaskIntoConstraints = false
        chooseLanguageLbl.textColor = .darkText
        chooseLanguageLbl.font = UIFont(name: "American Typewriter Bold", size: 33)
        chooseLanguageLbl.text = "Choose language"
        
        let englishLanguageView = LanguageView(
            flagImage: "engFlag", langugeName: "English", viewDidTaped: {
                self.languagePressed(0)
            }
        )
        languageViews.append(englishLanguageView)
        stackViewForBtns.addArrangedSubview(englishLanguageView)
        
        let russianLanguageView = LanguageView(
            flagImage: "ruFlag", langugeName: "Русский", viewDidTaped: {
                self.languagePressed(1)
            }
        )
        russianLanguageView.isUserInteractionEnabled = true
        languageViews.append(russianLanguageView)
        stackViewForBtns.addArrangedSubview(russianLanguageView)
        
        let uzbekLanguageView = LanguageView(
            flagImage: "uzFlag", langugeName: "O`zbekcha", viewDidTaped: {
                self.languagePressed(2)
            }
        )
        languageViews.append(uzbekLanguageView)
        stackViewForBtns.addArrangedSubview(uzbekLanguageView)
        
        stackViewForBtns.translatesAutoresizingMaskIntoConstraints = false
        stackViewForBtns.isUserInteractionEnabled = true
        stackViewForBtns.axis = .vertical
        stackViewForBtns.spacing = 11
        stackViewForBtns.alignment = .leading
        stackViewForBtns.distribution = .fill
        
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.setTitle(SetLanguage.setLanguage(.continueBtn), for: .normal)
        continueBtn.backgroundColor = .primaryAppColor
        continueBtn.setTitleColor(.white, for: .normal)
        continueBtn.layer.cornerRadius = 10
        continueBtn.clipsToBounds = true
        continueBtn.titleLabel?.font = UIFont(name: Constants.appFont, size: 21)
        continueBtn.addTarget(self, action: #selector(continuePressed(_:)), for: .touchUpInside)
        
        addConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(miniImage)
        view.addSubview(miniView)
        miniView.addSubview(chooseLanguageLbl)
        miniView.addSubview(stackViewForBtns)
        miniView.addSubview(continueBtn)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            miniImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            miniImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            miniImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            miniImage.heightAnchor.constraint(equalToConstant: 200),
            
            miniView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            miniView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            miniView.topAnchor.constraint(equalTo: miniImage.bottomAnchor, constant: -50),
            miniView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -33),
            
            chooseLanguageLbl.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 33),
            chooseLanguageLbl.centerXAnchor.constraint(equalTo: miniView.centerXAnchor),
            
            stackViewForBtns.topAnchor.constraint(equalTo: chooseLanguageLbl.bottomAnchor, constant: 33),
            stackViewForBtns.centerXAnchor.constraint(equalTo: miniView.centerXAnchor),
            
            continueBtn.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 25),
            continueBtn.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -25),
            continueBtn.bottomAnchor.constraint(equalTo: miniView.bottomAnchor, constant: -25),
            continueBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
}
