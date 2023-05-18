//
//  CommentsTableViewCell.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 17.03.2023.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    var nameLabel = UILabel()
    var emailLabel = UILabel()
    var bodyLabel = UILabel()
    
    func configure(with comment: Comment){
        //title label
        nameLabel.text = comment.name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .bold)
        //body label
        bodyLabel.text = comment.body
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textAlignment = .left
        bodyLabel.numberOfLines = 0
        
        // email label
        emailLabel.text = comment.email
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .heavy)
        //layout
        let stackView = UIStackView(arrangedSubviews: [emailLabel, nameLabel, bodyLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        self.contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.9).isActive = true
    }
}
