//
//  PostButton.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 17.05.2023.
//

import UIKit
import SnapKit

class PostButton : UIButton {
    private var iconView = UIImageView()
    private var label = UILabel()
    var isOn : Bool = false {
        didSet {
            if isOn {
                iconView.image = R.Images.Icons.likeFilled.withTintColor(R.Colors.filledLikeColor, renderingMode: .alwaysOriginal)
                label.text = "1"
            } else {
                iconView.image = R.Images.Icons.like.withTintColor(tintColor, renderingMode: .alwaysOriginal)
                label.text = "0"
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, image: UIImage) {
        super.init(frame: .zero)
        
        tintColor = .black
        configureLabel(with: title)
        configureImageView(with: image)
        constraintViews()
    }
    init(){
        super.init(frame: .zero)
    }
}

extension PostButton {
    func configureImageView(with image: UIImage) {
        iconView.image = image.withTintColor(tintColor, renderingMode: .alwaysTemplate)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(iconView)
    }
    
    func configureLabel(with text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textColor = tintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 22),
            iconView.widthAnchor.constraint(equalToConstant: 22),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            
            label.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 7),
            label.heightAnchor.constraint(equalToConstant: 22),
            label.widthAnchor.constraint(equalToConstant: 22),
        ])
    }
}
