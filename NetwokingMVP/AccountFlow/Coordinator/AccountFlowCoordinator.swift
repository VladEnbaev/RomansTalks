//
//  AccountFlowCoordinator.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import Foundation
import UIKit

protocol AccountFlowCoordinatorProtocol : CoordinatorProtocol{
    var navigationController : UINavigationController { get set }
    var moduleBuilder : AccountFlowBuilderProtocol { get set }
    var coordinator : AppCoordinatorProtocol { get set }
    
    init (navigationController: UINavigationController, moduleBuilder: AccountFlowBuilderProtocol, coordinator: AppCoordinatorProtocol, user: User?)
}

class AccountFlowCoordinator : AccountFlowCoordinatorProtocol{
    var navigationController: UINavigationController
    
    var moduleBuilder: AccountFlowBuilderProtocol
    
    var coordinator: AppCoordinatorProtocol
    
    var user : User?
    
    required init(navigationController: UINavigationController, moduleBuilder: AccountFlowBuilderProtocol, coordinator: AppCoordinatorProtocol, user: User?) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
        self.coordinator = coordinator
        self.user = user
    }
    
    func start() {
        let accountModule = moduleBuilder.createAccountModule(coordinator: self, user: self.user)
        navigationController.viewControllers = [accountModule]
    }
    
    
}
