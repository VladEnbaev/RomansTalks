//
//  RegistrationPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 21.03.2023.
//

import Foundation

protocol RegistrationPresenterProtocol : AnyObject{
    init(view: RegistrationViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol)
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    weak var view : RegistrationViewProtocol!
    var networkService : NetworkServiceProtocol!
    var coordinator : LoginFlowCoordinatorProtocol!
    
    required init(view: RegistrationViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
    }
}
