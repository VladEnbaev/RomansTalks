//
//  RegistrationViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 21.03.2023.
//

import UIKit

protocol RegistrationViewProtocol : AnyObject{
    var presenter : RegistrationPresenterProtocol! { get set }
    
    func showAlert(text: String)
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
        textFieldsStackView.setupVertical(spacing: 30, distribution: .fillEqually)
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textFieldsStackView)
        view.addSubview(createAccountButton)
        
        NSLayoutConstraint.activate([
            textFieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textFieldsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            textFieldsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50),
            createAccountButton.centerXAnchor.constraint(equalTo: textFieldsStackView.centerXAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            createAccountButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
}

extension RegistrationViewController : RegistrationViewProtocol {
    func showAlert(text: String) {
        let alert = UIAlertController(title: "ops",
                                      message: text,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

//MARK: - Actions
extension RegistrationViewController {
    @objc func createAccountButtonTapped() {
        presenter.set(username: usernameTextField.text ?? "",
                      email: emailTextField.text ?? "",
                      password: passwordTextField.text ?? "",
                      secondPassword: conformPasswordTextField.text ?? "")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// MARK: - Create UI
extension RegistrationViewController {
    func setupCreateAccountButton(button: UIButton) {
        button.layer.cornerRadius = 5
        button.backgroundColor = .green
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitleColor(button.backgroundColor, for: .highlighted)
        button.setTitle("CREATE", for: .normal)
        button.setTitle("CREATE", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupPasswordTextField(textField: UITextField) {
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        //textField.createPasswordToggle()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConformPasswordTextField(textField: UITextField) {
        textField.placeholder = "confirm your password"
        textField.isSecureTextEntry = true
        //textField.createPasswordToggle()
        textField.borderStyle = .roundedRect
        textField.delegate = self
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

extension RegistrationViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if conformPasswordTextField.text != passwordTextField.text {
            conformPasswordTextField.backgroundColor = .systemRed
            createAccountButton.isEnabled = false
        } else {
            conformPasswordTextField.backgroundColor = .clear
            createAccountButton.isEnabled = true

        }
    }
}
