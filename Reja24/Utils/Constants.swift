//
//  Constants.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 22/08/23.
//

import Foundation
import UIKit

let windowWidth = UIScreen.main.bounds.width
let windowHeight = UIScreen.main.bounds.height

struct Constants {
//    #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1)
    static var mainBackgroundColor: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return #colorLiteral(red: 0.1333333333, green: 0.1529411765, blue: 0.168627451, alpha: 1) // DarkNeutral200 - #22272B
           
            // kerak!  //#colorLiteral(red: 0.1999999881, green: 0.1999999881, blue: 0.1999999881, alpha: 1)
        } else {
            return #colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9176470588, alpha: 1) // DarkNeutral1100 - #DEE4EA
            //#colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9764705882, alpha: 1) // Neutral100
        }
    }
   
    static var backgroundColorForMiniView: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .black
        } else {
            return .white
        }
    }
    
    static var textColor: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .white
        } else {
            return .black
        }
    }
    
    static var menuBlurEfect: UIBlurEffect.Style {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .light
        } else {
            return .systemThinMaterialDark
        }
    }
    
    static var selectedTabbarColor: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .lightGray
        } else {
            return .darkGray
        }
    }
    
    static var unselectedTabbarColor: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .darkGray
        } else {
            return .lightGray
        }
    }
    
    //UserDefaults
    static var appLanguage                = "appLanguage"
    static var appMode                    = "appMode"
    static let userDefaultsForAppDelegate = "isStarted"
    static let firstNameTfForProfile      = "firstNameTF"
    static let secondNameTfForProfile     = "secondNameTF"
    static let userImageForProfile        = "userImage"
    
    // Images
    static let note3d_Image = "note3d_Image"
    
    static let TEMPLATE_TYPE_KEY = "TEMPLATE_TYPE_KEY"
    
    static let appFont = "American Typewriter"
}


