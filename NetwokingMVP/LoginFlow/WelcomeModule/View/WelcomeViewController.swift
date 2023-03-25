//
//  LoginViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import UIKit

protocol WelcomeViewProtocol : AnyObject{
    var presenter : WelcomePresenterProtocol! { get set }
    func sendAlert(text: String)
}

class WelcomeViewController: BaseViewController {
    
    var presenter : WelcomePresenterProtocol!
    var welcomeLabel =  UILabel()
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    var signInButton  = UIButton(type: .roundedRect)
    var registrationButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViews() {
        super.setupViews()
        self.view.backgroundColor = UIColor.systemBackground
        setupSignInButton(button: signInButton)
        setupRegistrationButton(button: registrationButton)
        setupUsernameTextField(textField: usernameTextField)
        setupPasswordTextField(textField: passwordTextField)
        setupWelcomeLabel(label: welcomeLabel)
    }
    
    override func constraintViews() {
        
        //text fields stackView
        let textFieldsStackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField])
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStackView.distribution = .fillEqually
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 10
        
        let buttonStackView = UIStackView(arrangedSubviews: [signInButton, registrationButton])
        buttonStackView.setupVertical(spacing: 10, distribution: .fillEqually)
        
        //stack view
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, textFieldsStackView, buttonStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 30
        
        //adding constraints
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    @objc func registrationButtonTapped(){
        presenter.registrationButtonTapped()
    }
    
    @objc func signInButtonTapped(){
        presenter.signInButtonTapped(username: usernameTextField.text,
                                     password: passwordTextField.text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

// MARK: - Create UI
extension WelcomeViewController {
    func setupSignInButton(button: UIButton) {
        button.layer.cornerRadius = 5
        button.backgroundColor = .tintColor
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitle("SIGN IN", for: .normal)
        button.setTitle("SIGN IN", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupPasswordTextField(textField: UITextField) {
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.createPasswordToggle()
        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupUsernameTextField(textField: UITextField) {
        textField.placeholder = "username"
        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupWelcomeLabel(label: UILabel){
        label.text = "WELCOME!"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .tintColor
        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupRegistrationButton(button: UIButton) {
        button.setTitle("i don't have an account", for: .normal)
        button.setTitle("i don't have an account", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
