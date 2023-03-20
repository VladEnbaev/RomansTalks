//
//  LoginViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import UIKit

protocol WelcomeViewProtocol {
    var presenter : WelcomePresenterProtocol! { get set }
    func sendAlert(text: String)
}

class WelcomeViewController: UIViewController {
    var presenter : WelcomePresenterProtocol!
    var signInButton = UIButton()
    var welcomeLabel = UILabel()
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        //signIn button
        signInButton = UIButton(type: .roundedRect)
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.setTitle("SIGN IN", for: .highlighted)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        //username textfield
        usernameTextField.placeholder = "username"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.textAlignment = .center
        //password textfield
        passwordTextField.placeholder = "password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textAlignment = .center
        //welcomeLabel
        welcomeLabel.text = "WELCOME!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        welcomeLabel.textColor = .tintColor
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        //autolayout
        //text fields stackView
        let textFieldsStackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField])
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 10
        //stack view 
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, textFieldsStackView, signInButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
    }
    
    @objc func signInButtonTapped(){
        presenter.signInButtonTapped(username: usernameTextField.text,
                                     password: passwordTextField.text)
    }
}

extension WelcomeViewController : WelcomeViewProtocol {
    func sendAlert(text: String) {
        let alert = UIAlertController(title: "ops",
                                      message: text,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
