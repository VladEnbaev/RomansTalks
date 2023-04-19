//
//  AccountViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import UIKit

protocol AccountViewProtocol : AnyObject {
    var presenter : AdditionalInfoPresenterProtocol! { get set }
    
    func setUser(_ user: User)
}

class AccountViewController: BaseViewController, AccountViewProtocol {
    var presenter: AdditionalInfoPresenterProtocol!
    var usernameLabel = UILabel()
    var emailLabel = UILabel()
    var profileImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViews() {
        <#code#>
    }
    
    override func constraintViews() {
        <#code#>
    }

    func setUser(_ user: User) {
        <#code#>
    }
}
