//
//  ChooseLanguageVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 03/10/23.
//

import UIKit

class ChooseLanguageVC: UIViewController {
    
    //MARK: Elements
    let miniImage         = UIImageView()
    let miniView          = UIView()
    let chooseLanguageLbl = UILabel()
    var languageButons    = [UIButton]()
    var languageViews      = [UIView]()
    
    let stackViewForBtns  = UIStackView()
    let continueBtn       = UIButton()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue("eng", forKey: Constants.appLanguage)
        setupViews()
    }
    
    //MARK: languagePressed
    func languagePressed(_ viewOrder: Int){
        for i in 0...2 {
            languageViews[i].layer.borderColor = UIColor.clear.cgColor
        }
        
        languageViews[viewOrder].layer.borderColor = #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1).cgColor
        
        switch viewOrder {
        case 0: UserDefaults.standard.set("eng", forKey: Constants.appLanguage)
        case 1: UserDefaults.standard.set("ru", forKey: Constants.appLanguage)
        default: UserDefaults.standard.set("uz", forKey: Constants.appLanguage)
        }
        
        chooseLanguageLbl.text = SetLanguage.setLanguage(.chooseLanguageLbl)
        continueBtn.setTitle(SetLanguage.setLanguage(.continueBtn), for: .normal)
    }
    
    //MARK: continuePressed
    @objc func continuePressed(_ sender: Any){
        let vc = StartVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
