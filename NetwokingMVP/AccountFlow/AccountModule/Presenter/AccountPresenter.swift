//
//  AccountPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import Foundation

protocol AccountPresenterProtocol : AnyObject{
    init(user: User, view: AdditionalInfoViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol)
}

class AccountPresenter: AccountPresenterProtocol {
    weak var view : AccountViewProtocol?
    var networkService : NetworkServiceProtocol!
    var coordinator : LoginFlowCoordinatorProtocol!
    var user : User?
    
    required init(user: User, view: AccountViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
        self.user = user
    }

    
}
