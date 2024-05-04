//
//  UIView+extension.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 01/05/24.
//

import UIKit

extension UIView {
    func setCornerRadius(_ cornerRadius: CGFloat = 11){
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}
