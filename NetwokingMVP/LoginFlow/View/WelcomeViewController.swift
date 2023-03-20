//
//  LoginViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import UIKit

protocol WelcomeViewProtocol {
    var presenter : WelcomePresenterProtocol! { get set }
}

class WelcomeViewController: UIViewController {
    var presenter : WelcomePresenterProtocol!
    var signInButton = UIButton()
    var welcomeLabel = UILabel()
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //signIn button
        signInButton.titleLabel?.text = "Sign In"
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        //username textfield
        usernameTextField.placeholder = "username"
        //password textfield
        passwordTextField.placeholder = "username"
        passwordTextField.isSecureTextEntry = true
        //autolayout
        let textFieldsStackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField])
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, textFieldsStackView, signInButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
    }
    
    @objc func signInButtonTapped(){
        presenter.signInButtonTapped()
    }
}

extension WelcomeViewController : WelcomeViewProtocol {
    
}
