//
//  DetailPostTableViewCell.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 18.03.2023.
//

import UIKit

class DetailPostTableViewCell: PostTableViewCell {
    
    var separatorView = UIView()
    
    override func configure(with post: Post) {
        super.configure(with: post)
        self.titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.bodyLabel.font = UIFont.systemFont(ofSize: 15)
        self.isUserInteractionEnabled = true
        titleLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
    }
    override func setupTextStackView() {
        separatorView.backgroundColor = R.Colors.cellsBackground
        textStackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel, separatorView])
        textStackView.spacing = 8
        textStackView.alignment = .firstBaseline
        textStackView.axis = .vertical
        textStackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
