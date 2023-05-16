//
//  PostTableViewCell.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit



class PostTableViewCell: UITableViewCell {

    enum Constants : CGFloat{
        case shadowRadius = 3
        case cellsOffset  = 8
    }
    
    
    var titleLabel = UILabel()
    var bodyLabel = UILabel()
    var curvedView = UIView()
    var shareIconUIImageView = {
        let imageView = UIImageView(image: Resources.Images.Icons.share)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var post : Post!
    
    
    func configure(with post: Post){
        self.post = post
        setupTitleLabel()
        setupBodyLabel()
        setupCurvedView()
        constraintViews()
        
    }
    
    func constraintViews(){
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.spacing = 13
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(curvedView)
        self.curvedView.addSubview(stackView)
        self.curvedView.addSubview(shareIconUIImageView)
        
        NSLayoutConstraint.activate( [
            shareIconUIImageView.heightAnchor.constraint(equalToConstant: 25),
            shareIconUIImageView.heightAnchor.constraint(equalToConstant: 25),
            shareIconUIImageView.bottomAnchor.constraint(equalTo: curvedView.bottomAnchor, constant: -16),
            shareIconUIImageView.trailingAnchor.constraint(equalTo: curvedView.trailingAnchor, constant: -16),
            
            curvedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            curvedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            curvedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            curvedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.cellsOffset.rawValue),
            
            
            stackView.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 23),
            stackView.bottomAnchor.constraint(equalTo: curvedView.bottomAnchor, constant: -23),
            stackView.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: curvedView.trailingAnchor, constant: -18),
        ])
    }
    
    func setupTitleLabel(){
        titleLabel.text = post.title
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .heavy, width: .expanded)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
    }
    func setupBodyLabel(){
        bodyLabel.text = post.body
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textAlignment = .natural
        bodyLabel.numberOfLines = 5
    }
    
    func setupCurvedView() {
        curvedView.backgroundColor = Resources.Colors.cellsBackground
        curvedView.translatesAutoresizingMaskIntoConstraints = false
        curvedView.layer.cornerRadius = 20
        curvedView.layer.shadowColor = UIColor.black.cgColor
        curvedView.layer.shadowOpacity = 0.125
        curvedView.layer.shadowOffset = .zero
        curvedView.layer.shadowRadius = Constants.shadowRadius.rawValue
        curvedView.layer.shadowOffset = CGSize(width: 0, height: 4)
        curvedView.layer.masksToBounds = false
    }
    
}
