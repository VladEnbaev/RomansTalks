//
//  RegistrationViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 21.03.2023.
//

import UIKit

protocol RegistrationViewProtocol : AnyObject{
    var presenter : RegistrationPresenterProtocol! { get set }
}

class RegistrationViewController: UIViewController {

    var presenter : RegistrationPresenterProtocol!
//    var usernameTextField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "create account"
    }
    
}

extension RegistrationViewController : RegistrationViewProtocol {
    
}
