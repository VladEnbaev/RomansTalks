//
//  AccountViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import UIKit
import SnapKit

protocol AccountViewProtocol : AnyObject {
    var presenter : AccountPresenterProtocol! { get set }
    
    func setUser(_ user: User)
    
    func showAlert(text: String)
}

class AccountViewController: BaseViewController, AccountViewProtocol {
    
    var presenter: AccountPresenterProtocol!
    var topView = AccountTopInfoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        presenter.viewIsLoaded()
    }
    
    func setUser(_ user: User) {
        topView.setup(username: user.username, email: user.email, image: UIImage())
        setupTopView()
    }
    
    func showAlert(text: String) {
        let alert = UIAlertController(title: "ops",
                                      message: text,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

extension AccountViewController {
    func setupTopView(){
        view.addSubview(topView)
        print(view.safeAreaInsets.top)
        topView.snp.makeConstraints(){ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }
}
