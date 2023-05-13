//
//  AppCoordinator.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import Foundation
import UIKit

protocol CoordinatorProtocol : AnyObject{
    func start()
}

protocol AppCoordinatorProtocol : CoordinatorProtocol {
    init (navigationController: UINavigationController)
    func showLoginFlow()
    func showTabBarFlow(with user: User)
}

class AppCoordinator : AppCoordinatorProtocol {
    var navigationController : UINavigationController!
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    
    func showLoginFlow(){
        let moduleBuilder = LoginFlowBuilder()
        let coordinatorLoginFlow = LoginFlowCoordinator(navigationController: navigationController, moduleBuilder: moduleBuilder, coordinator: self)
        coordinatorLoginFlow.start()
    }
    
    func showTabBarFlow(with user: User) {
        let tabBarBuilder = TabBarBuilder()
        let tabBar = tabBarBuilder.createTabBar(user: user, coordinator: self)
        self.navigationController.viewControllers = [tabBar]
    }
    
    func start() {
        showLoginFlow()
        
    }
    

}
