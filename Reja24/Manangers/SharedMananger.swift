//
//  SharedMananger.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 24/04/24.
//

import Foundation

enum AppMode {
    case light, dark
}

class SharedMananger {
   static func getCurrentMode() -> AppMode? {
       let mode = UserDefaults.standard.string(forKey: Constants.appMode)
        
        if mode == "light" {
            return .light
        } else if mode == "dark" {
            return .dark
        } else {
            return nil
        }
    }
}
