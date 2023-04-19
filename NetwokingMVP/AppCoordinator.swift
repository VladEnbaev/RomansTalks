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
        let coordinatorFlow1 = LoginFlowCoordinator(navigationController: navigationController, moduleBuilder: moduleBuilder, coordinator: self)
        coordinatorFlow1.start()
    }
    
    func showTabBarFlow(with user: User) {
        let testVC = UIViewController()
        testVC.view.backgroundColor = .systemBackground
        testVC.title = "\(user.username)"
        let tabBarController = UITabBarController()
        let navControllerPostsFlow = UINavigationController()
        let navControllerFakeFlow2 = UINavigationController()
        let moduleBuilderPostsFlow = PostsFeedFlowModulesBuilder()
        let coordinatorFlow1 = PostsFeedFlowCoordinator(navigationController: navControllerPostsFlow, moduleBuilder: moduleBuilderPostsFlow)
        coordinatorFlow1.start()
        
        tabBarController.viewControllers = [navControllerPostsFlow, navControllerFakeFlow2]
        navControllerPostsFlow.tabBarItem = UITabBarItem(title: "posts",
                                                  image: UIImage(systemName: "ellipsis"),
                                                  tag: 1)
        navControllerFakeFlow2.tabBarItem = UITabBarItem(title: "profile",
                                                  image: UIImage(systemName: "person.crop.circle"),
                                                  tag: 2)
        navControllerFakeFlow2.viewControllers = [testVC]
        
        
        navigationController.viewControllers = [tabBarController]
    }
    
    func start() {
//        showLoginFlow()
        var user = User()
        user.email = "recieved email"
        user.username = "vladislav"
        let view = AccountViewController()
        let presenter = AccountPresenter(user: user, view: view, networkService: NetworkService(), coordinator: self)
        view.presenter = presenter
        navigationController.viewControllers = [view]
        
    }
    

}
