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
    var post : Post!
    
    func configure(with post: Post){
        self.post = post
        setupTitleLabel(titleLabel)
        setupBodyLabel(bodyLabel)
        constraintViews()
        
    }
    
    func constraintViews(){
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        self.contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    func setupTitleLabel(_ label: UILabel){
        label.text = post.title
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
    }
    func setupBodyLabel(_ label: UILabel){
        label.text = post.body
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
    }
    
}
