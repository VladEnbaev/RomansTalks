//
//  LoginModulePresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import Foundation

protocol WelcomePresenterProtocol : AnyObject {
    init(view: WelcomeViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol)
    func signInButtonTapped()
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
    
    func signInButtonTapped() {
        coordinator.autorisationIsEnd(with: User.admin)
    }
}
