//
//  PlusButtonView.swift
//  Reja24
//
//  Created by Sarvar Qosimov on 29/04/24.
//

import UIKit

class PlusButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
    }
    
    private func configure(){
        setImage(UIImage(systemName: "plus"), for: .normal)
        tintColor = .white
        backgroundColor = .red
    }
    
}
