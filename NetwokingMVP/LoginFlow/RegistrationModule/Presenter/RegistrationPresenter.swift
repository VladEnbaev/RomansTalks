//
//  RegistrationPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 21.03.2023.
//

import Foundation

protocol RegistrationPresenterProtocol : AnyObject{
    init(view: RegistrationViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol)
    
    func set(username: String, email: String, password: String, secondPassword: String)
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    weak var view : RegistrationViewProtocol!
    var networkService : NetworkServiceProtocol!
    var coordinator : LoginFlowCoordinatorProtocol!
    var user  = User()
    
    required init(view: RegistrationViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    func set(username: String, email: String, password: String, secondPassword: String) {
        if username.isEmpty {
            view.showAlert(text: Resources.ErrorTexts.usernameEmpty)
        } else if email.isEmpty{
            view.showAlert(text: Resources.ErrorTexts.emailEmpty)
        } else if password.isEmpty{
            view.showAlert(text: Resources.ErrorTexts.passwordEmpty)
        }
        
//        user.email = email
//        user.username = username
    }
}
