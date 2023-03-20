//
//  LoginModulePresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import Foundation

protocol WelcomePresenterProtocol : AnyObject {
    init(view: WelcomeViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol)
    func signInButtonTapped(username: String?, password: String?)
}

class WelcomePresenter : WelcomePresenterProtocol {
    var view : WelcomeViewProtocol
    var networkSevice : NetworkServiceProtocol
    var coordinator : LoginFlowCoordinatorProtocol
    var user : User?
    
    required init(view: WelcomeViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol) {
        self.view = view
        self.networkSevice = networkService
        self.coordinator = coordinator
    }
    
    func signInButtonTapped(username: String?, password: String?) {
        if password == "" || username == "" {
            view.sendAlert(text: Resources.ErrorTexts.usernameEmpty)
        } else if  password == "admin" && username == "admin"{
            coordinator.autorisationIsEnd(with: User.admin)
        } else {
            view.sendAlert(text: Resources.ErrorTexts.needToRegistration)
        }
    }
}
