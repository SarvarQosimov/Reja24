//
//  LanguageView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 23/04/24.
//

import Foundation
import UIKit

class LanguageView: UIView {
    private var flagImage: String = ""
    private var langugeName: String = ""
    
    var viewDidTaped: ( ()-> Void )?
    
    init(flagImage: String, langugeName: String, viewDidTaped: ( ()-> Void )?) {
        self.flagImage = flagImage
        self.langugeName = langugeName
        self.viewDidTaped = viewDidTaped
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initViews() {
        
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.clear.cgColor
        
        let flagImageView = UIImageView()
        self.addSubview(flagImageView)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.image = UIImage(named: self.flagImage)
        
        
        let languageNameLabel = UILabel()
        self.addSubview(languageNameLabel)
        languageNameLabel.translatesAutoresizingMaskIntoConstraints = false
        languageNameLabel.text = self.langugeName
        languageNameLabel.font = UIFont(name: Constants.appFont, size: 23)
        languageNameLabel.textColor = .black
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewPressed(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 45),
            self.widthAnchor.constraint(equalToConstant: windowWidth/1.5),
            
            flagImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            flagImageView.widthAnchor.constraint(equalToConstant: 30),
            flagImageView.heightAnchor.constraint(equalToConstant: 30),
            flagImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            languageNameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 7),
            languageNameLabel.centerYAnchor.constraint(equalTo: flagImageView.centerYAnchor),
        ])
    }
    
    @objc func viewPressed(_ sender: UIButton){
        viewDidTaped?()
    }
    
}
