//
//  LoginFlowCoordinator.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import Foundation
import UIKit

protocol LoginFlowCoordinatorProtocol : CoordinatorProtocol{
    var navigationController : UINavigationController { get set }
    var moduleBuilder : LoginFlowBuilderProtocol { get set }
    var coordinator : AppCoordinatorProtocol { get set }
    init (navigationController: UINavigationController, moduleBuilder: LoginFlowBuilderProtocol, coordinator: AppCoordinatorProtocol)
    func autorisationIsEnd(with user: User)
}

class LoginFlowCoordinator : LoginFlowCoordinatorProtocol {
    var navigationController: UINavigationController
    
    var moduleBuilder: LoginFlowBuilderProtocol
    
    var coordinator: AppCoordinatorProtocol
    
    required init(navigationController: UINavigationController, moduleBuilder: LoginFlowBuilderProtocol, coordinator: AppCoordinatorProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
        self.coordinator = coordinator
    }
    
    
    func autorisationIsEnd(with user: User) {
        coordinator.showTabBarFlow(with: user)
    }
    
    func start() {
        let welcomeModule = moduleBuilder.createWelcomeModule(coordinator: self)
        navigationController.viewControllers = [welcomeModule]
    }
    
    
}
