//
//  UIColor+extension.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 24/04/24.
//

import Foundation
import UIKit

extension UIColor {
    static var primaryAppColor: UIColor {
         return #colorLiteral(red: 0.3490196078, green: 0.4039215686, blue: 0.4509803922, alpha: 1) // 596773 - DarkNeutral500
    }
}

extension UIColor {
    func toHex() -> String? {
        guard let components = self.cgColor.components else {
            return nil
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        let hexString = String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        
        return hexString
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        let a: CGFloat = 1.0

        if hex.hasPrefix("#") {

            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt32 = 0

                if scanner.scanHexInt32(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255.0
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255.0
                    b = CGFloat(hexNumber & 0x0000ff) / 255.0

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
