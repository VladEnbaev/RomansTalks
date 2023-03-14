//
//  PostTableViewCell.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var bodyLabel = UILabel()
    var userButton = UIButton(type: .system)
    
    func configure(with post: Post){
        //title label
        titleLabel.text = post.title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        //body label
        bodyLabel.text = post.body
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textAlignment = .left
        // user button
        userButton.setTitle("\(post.userId)", for: .normal)
        userButton.isUserInteractionEnabled = false
        userButton.contentHorizontalAlignment = .left
        userButton.titleEdgeInsets = UIEdgeInsets.zero
        //layout
        let stackView = UIStackView(arrangedSubviews: [userButton, titleLabel, bodyLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        self.contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.9).isActive = true
        
    }
}
