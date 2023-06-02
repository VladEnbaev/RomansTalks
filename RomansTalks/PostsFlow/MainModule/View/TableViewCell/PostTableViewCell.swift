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
        case contentOffsetBottom = 15
        case profileImageSideLenght = 35
    }
    
    var post : Post!
    
    var usernameLable = UILabel()
    var emailLable = UILabel()
    var profilePhotoImageView = UIImageView()
    var titleLabel = UILabel()
    var bodyLabel = UILabel()
    var curvedView = PostShadowView(shadowRadius: Constants.shadowRadius.rawValue)
    var shareButton = PostButton()
    var likesButton = PostButton()
    var commentsButton = PostButton()
    
    var userNamesStackView = UIStackView()
    var userInfoStackView =  UIStackView()
    var activityStackView = UIStackView()
    var textStackView =     UIStackView()
    
    func configure(with post: Post){
        self.post = post
        selectionStyle = .none
        
        setupLikeButton()
        setupShareButton()
        setupComentButton()
        setupTitleLabel()
        setupBodyLabel()
        setupEmailLabel()
        setupUsernameLabel()
        setupTitleLabel()
        setupProilePhotoImageView()
        
        setupUserNamesStackView()
        setupUserInfoStackView()
        setupActivityStackView()
        setupTextStackView()
        
        constraintViews()
        
    }
    
    private func constraintViews(){
        contentView.addSubview(curvedView)
        curvedView.addSubview(userInfoStackView)
        curvedView.addSubview(textStackView)
        curvedView.addSubview(activityStackView)
        
        NSLayoutConstraint.activate( [
            profilePhotoImageView.heightAnchor.constraint(equalToConstant: Constants.profileImageSideLenght.rawValue),
            profilePhotoImageView.widthAnchor.constraint(equalToConstant: Constants.profileImageSideLenght.rawValue),
            
            curvedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            curvedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            curvedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            curvedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.cellsOffset.rawValue),
            
            userInfoStackView.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 15),
            userInfoStackView.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: Constants.contentOffset.rawValue),
            userInfoStackView.trailingAnchor.constraint(equalTo: curvedView.trailingAnchor, constant: -Constants.contentOffset.rawValue),
            
            textStackView.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 15),
            textStackView.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: Constants.contentOffset.rawValue),
            textStackView.trailingAnchor.constraint(equalTo: curvedView.trailingAnchor, constant: -Constants.contentOffset.rawValue),
            
            activityStackView.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 15),
            activityStackView.leadingAnchor.constraint(equalTo: curvedView.leadingAnchor, constant: Constants.contentOffset.rawValue),
            activityStackView.widthAnchor.constraint(equalToConstant: 153),
            activityStackView.bottomAnchor.constraint(equalTo: curvedView.bottomAnchor, constant: -15)
        ])
    }
    
    func setupUserNamesStackView() {
        userNamesStackView = UIStackView(arrangedSubviews: [usernameLable, emailLable])
        userNamesStackView.spacing = 3
        userNamesStackView.axis = .vertical
        userNamesStackView.distribution = .fillEqually
        userNamesStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupUserInfoStackView() {
        userInfoStackView = UIStackView(arrangedSubviews: [profilePhotoImageView, userNamesStackView])
        userInfoStackView.spacing = 21
        userInfoStackView.axis = .horizontal
        userInfoStackView.distribution = .fill
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupActivityStackView() {
        activityStackView = UIStackView(arrangedSubviews: [likesButton, commentsButton, shareButton])
        activityStackView.spacing = 8
        activityStackView.axis = .horizontal
        activityStackView.distribution = .fillProportionally
        activityStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTextStackView() {
        textStackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        textStackView.spacing = 8
        textStackView.axis = .vertical
        textStackView.translatesAutoresizingMaskIntoConstraints = false
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
    
    func setupUsernameLabel() {
        usernameLable.text =  post.user?.username ?? "username"
        usernameLable.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        usernameLable.numberOfLines = 1
        usernameLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupEmailLabel() {
        emailLable.text = post.user?.email ?? "email@gmail.com"
        emailLable.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        emailLable.textColor = Resources.Colors.lightGrey
        emailLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupProilePhotoImageView() {
        profilePhotoImageView.image = Resources.Images.Photos.none
        profilePhotoImageView.makeCornerRadius(radius: Constants.profileImageSideLenght.rawValue / 2)
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
