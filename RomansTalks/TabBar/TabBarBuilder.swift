//
//  TabBarBuilder.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import Foundation
import UIKit

protocol TabBarBuilderProtocol{
    func createTabBar(user: User?, coordinator: AppCoordinatorProtocol) -> UITabBarController
}

class TabBarBuilder: TabBarBuilderProtocol {
    func createTabBar(user: User?, coordinator: AppCoordinatorProtocol) -> UITabBarController {
        
        let tabBarController = MainTabBarController()
//        tabBarController.setupTabBar()
        //postsFlow
        let navControllerPostsFlow = PostsNavigationControlller()
        navControllerPostsFlow.setup()
        let moduleBuilderPostsFlow = PostsFeedFlowModulesBuilder()
        let coordinatorPostsFlow = PostsFeedFlowCoordinator(navigationController: navControllerPostsFlow,
                                                            moduleBuilder: moduleBuilderPostsFlow)
        //accountFlow
        let navControllerAccountFlow = UINavigationController()
        let moduleBulderAccountFlow = AccountFlowBuilder()
        let coordinatorAccountFlow = AccountFlowCoordinator(navigationController: navControllerAccountFlow,
                                                            moduleBuilder: moduleBulderAccountFlow,
                                                            coordinator: coordinator,
                                                            user: user)
        //moc add post ViewController
        let mocVC = UIViewController()
        mocVC.view.backgroundColor = .white
        
        tabBarController.setupViewControllers([navControllerPostsFlow, mocVC, navControllerAccountFlow])
        tabBarController.selectedViewController = navControllerPostsFlow
        
        coordinatorPostsFlow.start()
        coordinatorAccountFlow.start()
        
        return tabBarController
        
    }
    
}
