//
//  DetailPostTableViewCell.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 18.03.2023.
//

import UIKit

class DetailPostTableViewCell: PostTableViewCell {
    
    var userButton = UIButton(type: .system)
    
    override func configure(with post: Post) {
        super.configure(with: post)
        setupUserButton(userButton)
        self.titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.bodyLabel.font = UIFont.systemFont(ofSize: 15)
        self.userButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        self.userButton.isUserInteractionEnabled = true
        self.isUserInteractionEnabled = false
    }
    
    override func constraintViews() {
        let titleStackView = UIStackView(arrangedSubviews: [userButton, titleLabel])
        let stackView = UIStackView(arrangedSubviews: [titleStackView, bodyLabel])
        titleStackView.axis = .vertical
        titleStackView.spacing = -2
        stackView.spacing = 5
        stackView.axis = .vertical
        self.contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    func setupUserButton(_ button: UIButton){
        button.setTitle("\(post.user?.username ?? "")", for: .normal)
        button.isUserInteractionEnabled = false
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets.zero
    }
}
