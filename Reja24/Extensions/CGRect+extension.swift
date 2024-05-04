//
//  CGRect+extension.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import Foundation

extension CGRect {
    static func defaultValue() -> CGRect {
        CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
    }
}
