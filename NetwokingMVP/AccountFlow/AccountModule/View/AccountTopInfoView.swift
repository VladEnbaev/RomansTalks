//
//  AccountTopInfoView.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import UIKit
import SnapKit

class AccountTopInfoView: UIView {
    
    var usernameLabel = UILabel()
    var emailLabel = UILabel()
    var profileImageView = UIImageView()
    var labelsStackView = UIStackView()
    
    func setup(username: String, email: String, image: UIImage){
        backgroundColor = .systemGray.withAlphaComponent(0.1)
        setupLabelsStackView()
        setupUsernameLabel()
        setupEmailLabel()
        setupProfileImageView()
        usernameLabel.text = username
        emailLabel.text = email
    }

}
extension AccountTopInfoView {
    func setupLabelsStackView(){
        self.addSubview(labelsStackView)
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 5
        labelsStackView.distribution = .fillEqually
        labelsStackView.snp.makeConstraints(){ make in
            make.centerY.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(80)
        }
    }
    
    func setupEmailLabel(){
        emailLabel.text = "email"
        labelsStackView.addArrangedSubview(emailLabel)
    }
    
    func setupUsernameLabel() {
        usernameLabel.text = "username"
        labelsStackView.addArrangedSubview(usernameLabel)
    }
    
    func setupProfileImageView(){
        profileImageView.backgroundColor = .blue
        self.addSubview(profileImageView)
        profileImageView.snp.makeConstraints(){ make in
            make.centerY.equalTo(labelsStackView)
            make.height.width.equalTo(80)
            make.left.equalToSuperview().inset(20)
            
        }
    }
}
