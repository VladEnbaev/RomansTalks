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
        case contentOffset = 20
    }
    
    var post : Post!
    
    var usernameLable = UILabel()
    var emailLable = UILabel()
    var profilePhotoImageView = UIImageView()
    var titleLabel = UILabel()
    var bodyLabel = UILabel()
    var curvedView = UIView()
    var shareButton = PostButton()
    var likesButton = PostButton()
    var commentsButton = PostButton()
    
    
    
    func configure(with post: Post){
        self.post = post
        
        setupLikeButton()
        setupShareButton()
        setupComentButton()
        setupTitleLabel()
        setupBodyLabel()
        setupEmailLabel()
        setupTitleLabel()
        setupProilePhotoImageView()
        setupCurvedView()
        
        constraintViews()
        
    }
}
private extension PostTableViewCell {
    func constraintViews(){
        
        translatesAutoresizingMaskIntoConstraints = false
        setNeedsLayout()
        layoutIfNeeded()
        
        let userNamesStackView = UIStackView(arrangedSubviews: [usernameLable, emailLable])
        userNamesStackView.spacing = 3
        userNamesStackView.axis = .vertical
        userNamesStackView.distribution = .fillEqually
        userNamesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let userInfoStackView = UIStackView(arrangedSubviews: [profilePhotoImageView, userNamesStackView])
        userInfoStackView.spacing = 21
        userInfoStackView.axis = .horizontal
        userInfoStackView.distribution = .fill
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let activityStackView = UIStackView(arrangedSubviews: [likesButton, commentsButton, shareButton])
        activityStackView.spacing = 8
        activityStackView.axis = .horizontal
        activityStackView.distribution = .fillProportionally
        activityStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        labelsStackView.spacing = 8
        labelsStackView.axis = .vertical
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(curvedView)
        curvedView.addSubview(userInfoStackView)
        curvedView.addSubview(labelsStackView)
        curvedView.addSubview(activityStackView)
        
        NSLayoutConstraint.activate( [
            profilePhotoImageView.heightAnchor.constraint(equalToConstant: 50),
            profilePhotoImageView.widthAnchor.constraint(equalToConstant: 50),
            
            curvedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            curvedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            curvedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            curvedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.cellsOffset.rawValue),
            
            userInfoStackView.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 15),
            userInfoStackView.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: Constants.contentOffset.rawValue),
            userInfoStackView.trailingAnchor.constraint(equalTo: curvedView.trailingAnchor, constant: -Constants.contentOffset.rawValue),
            
            labelsStackView.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 15),
            labelsStackView.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: Constants.contentOffset.rawValue),
            labelsStackView.trailingAnchor.constraint(equalTo: curvedView.trailingAnchor, constant: -Constants.contentOffset.rawValue),
            
            activityStackView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 15),
            activityStackView.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: Constants.contentOffset.rawValue),
            activityStackView.widthAnchor.constraint(equalToConstant: 153),
            activityStackView.bottomAnchor.constraint(equalTo: curvedView.bottomAnchor, constant: -15)
        ])
    }
    
    func setupTitleLabel() {
        titleLabel.text = post.title
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
    }
    func setupBodyLabel() {
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
    
    func setupUsernameLabel() {
        usernameLable.text = "username" // post.user?.username
        usernameLable.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        usernameLable.numberOfLines = 1
        usernameLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupEmailLabel() {
        emailLable.text = "email@gmail.com" //post.user?.email ?? "email@gmail.com"
        emailLable.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        emailLable.textColor = Resources.Colors.lightGrey
        emailLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupProilePhotoImageView() {
        profilePhotoImageView.image = Resources.Images.Photos.none
        profilePhotoImageView.makeCircle()
        usernameLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupShareButton() {
        shareButton = PostButton(title: "", image: R.Images.Icons.share)
        shareButton.makeSystem(shareButton)
    }
    
    func setupComentButton() {
        commentsButton = PostButton(title: "10", image: R.Images.Icons.coment)
        commentsButton.makeSystem(commentsButton)
    }
    
    func setupLikeButton() {
        likesButton = PostButton(title: "0", image: R.Images.Icons.like)
        likesButton.makeSystem(likesButton)
    }
}
