//
//  CommentsTableViewCell.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 17.03.2023.
//

import UIKit
import SnapKit

class CommentsTableViewCell: UITableViewCell {
    
    enum Constants : CGFloat{
        case shadowRadius = 3
        case cellsOffset  = 8
        case contentOffsetHorizontal = 20
        case contentOffsetVertical = 15
        case profileImageSideLenght = 35
    }
    
    var comment : Comment!

    var nameLabel = UILabel()
    var emailLabel = UILabel()
    var bodyLabel = UILabel()
    
    var stackView = UIStackView()
    var curvedView = PostShadowView(shadowRadius: 2)
    
    func configure(with comment: Comment){
        self.comment = comment
        
        selectionStyle = .none
        
        setupNameLabel()
        setupBodyLabel()
        setupEmailLabel()
        setupStackView()
        
        constraintViews()
    }
    
    func setupNameLabel() {
        nameLabel.text = comment.name
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .bold)
    }
    
    func setupBodyLabel() {
        bodyLabel.text = comment.body
        bodyLabel.font = UIFont.systemFont(ofSize: 15)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textAlignment = .left
        bodyLabel.numberOfLines = 0
        
    }
    
    func setupEmailLabel() {
        emailLabel.text = comment.email
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .heavy)
    }
    
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [emailLabel, nameLabel, bodyLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constraintViews() {
        curvedView.addSubview(stackView)
        contentView.addSubview(curvedView)
        
        curvedView.snp.makeConstraints() { make in
            make.trailing.leading.equalToSuperview().inset(Constants.contentOffsetHorizontal.rawValue)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.shadowRadius.rawValue)
        }
        
        stackView.snp.makeConstraints() { make in
            make.trailing.leading.equalToSuperview().inset(Constants.contentOffsetHorizontal.rawValue)
            make.top.bottom.equalToSuperview().inset(Constants.contentOffsetVertical.rawValue)
        }
    }
    
}
