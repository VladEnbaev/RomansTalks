//
//  DetailPostTableViewCell.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 18.03.2023.
//

import UIKit

class DetailPostTableViewCell: PostTableViewCell {
    override func configure(with post: Post) {
        super.configure(with: post)
        self.titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.bodyLabel.font = UIFont.systemFont(ofSize: 20)
        self.userButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        self.userButton.isUserInteractionEnabled = true
        self.isUserInteractionEnabled = false
    }
}
