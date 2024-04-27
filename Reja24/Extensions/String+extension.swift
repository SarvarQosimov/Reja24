//
//  String+extension.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 25/04/24.
//

import Foundation
import UIKit

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
    
    func convertToIntArray() -> [Int]{
        var convertedArray = [Int]()
        for i in self {
            if let num = Int(String(i)) {
                convertedArray.append(num)
            }
        }
        return convertedArray
    }
    
}
