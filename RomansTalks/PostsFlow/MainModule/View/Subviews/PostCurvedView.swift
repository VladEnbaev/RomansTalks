//
//  Postself.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 02.06.2023.
//

import UIKit

class PostShadowView: UIView {
    
    init(shadowRadius: CGFloat) {
        super.init(frame: CGRect.zero)
        setup(shadowRadius: shadowRadius)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(shadowRadius: CGFloat) {
        self.backgroundColor = Resources.Colors.cellsBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.125
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.masksToBounds = false
    }
    
}
