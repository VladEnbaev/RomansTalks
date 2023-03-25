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

class RegistrationViewController: BaseViewController {

    var presenter : RegistrationPresenterProtocol!
    var usernameTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var conformPasswordTextField = UITextField()
    var createAccountButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "create account"
    }
    
    override func setupViews() {
        setupCreateAccountButton(button: createAccountButton)
        setupPasswordTextField(textField: passwordTextField)
        setupUsernameTextField(textField: usernameTextField)
        setupConformPasswordTextField(textField: conformPasswordTextField)
        setupEmailTextField(textField: emailTextField)
        
    }
    override func constraintViews() {
        let textFieldsStackView = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passwordTextField, conformPasswordTextField])
        textFieldsStackView.setupVertical(spacing: 30, distribution: .fillProportionally)
        
        //stack view
        let stackView = UIStackView(arrangedSubviews: [textFieldsStackView, createAccountButton])
        stackView.setupVertical(spacing: 50, distribution: .equalSpacing)
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7).isActive = true
    }
}

extension RegistrationViewController : RegistrationViewProtocol {
    
}

// MARK: - Create UI
extension RegistrationViewController {
    func setupCreateAccountButton(button: UIButton) {
        button.layer.cornerRadius = 5
        button.backgroundColor = .tintColor
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitle("CREATE", for: .normal)
        button.setTitle("CREATE", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        //button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupPasswordTextField(textField: UITextField) {
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.createPasswordToggle()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConformPasswordTextField(textField: UITextField) {
        textField.placeholder = "confirm your password"
        textField.isSecureTextEntry = true
        textField.createPasswordToggle()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupUsernameTextField(textField: UITextField) {
        textField.placeholder = "username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupEmailTextField(textField: UITextField) {
        textField.placeholder = "email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
}
