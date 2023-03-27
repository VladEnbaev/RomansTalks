//
//  AdditionalInfoPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 26.03.2023.
//

import Foundation

protocol AdditionalInfoPresenterProtocol : AnyObject{
    init(view: AdditionalInfoViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol)
}

class AdditionalInfoPresenter : AdditionalInfoPresenterProtocol {
    
    weak var view : AdditionalInfoViewProtocol?
    var networkService : NetworkServiceProtocol
    var coordinator : CoordinatorProtocol
    
    required init(view: AdditionalInfoViewProtocol, networkService: NetworkServiceProtocol, coordinator: LoginFlowCoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    
    
}
