//
//  AccountPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import Foundation

protocol AccountPresenterProtocol : AnyObject{
    init(user: User?, view: AccountViewProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol)
    func viewIsLoaded()
}

class AccountPresenter: AccountPresenterProtocol {
    
    weak var view : AccountViewProtocol?
    var networkService : NetworkServiceProtocol!
    var coordinator : CoordinatorProtocol!
    var user : User?
    
    required init(user: User?, view: AccountViewProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
        self.user = user
    }
    
    func viewIsLoaded() {
        if let user = user {
            view?.setUser(user)
        } else {
            view?.showAlert(text: "")
        }
    }
}
