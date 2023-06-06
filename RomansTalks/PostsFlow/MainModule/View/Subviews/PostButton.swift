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
    var isOn : Bool = false{
        willSet {
            if isOn {
                label.text = "1"
                iconView.image = R.Images.Icons.likeFilled.withTintColor(R.Colors.filledLikeColor, renderingMode: .alwaysOriginal)
            } else {
                label.text = "0"
                iconView.image = R.Images.Icons.like.withTintColor(tintColor, renderingMode: .alwaysOriginal)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero)
        isOn = false
        tintColor = .black
    }
}

extension PostButton {
    func configure(title: String, image: UIImage) {
        configureLabel(with: title)
        configureImageView(with: image)
        constraintViews()
    }
    
    private func configureImageView(with image: UIImage) {
        iconView.image = image.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(iconView)
    }
    
    private func configureLabel(with text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textColor = tintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
    }
    
    private func constraintViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 23),
            iconView.widthAnchor.constraint(equalToConstant: 23),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            
            label.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 7),
            label.heightAnchor.constraint(equalToConstant: 23),
            label.widthAnchor.constraint(equalToConstant: 23),
        ])
    }
}
