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
        let tabBarController = UITabBarController()
        //postsFlow
        let navControllerPostsFlow = UINavigationController()
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
        coordinatorPostsFlow.start()
        coordinatorAccountFlow.start()
        
        tabBarController.viewControllers = [navControllerPostsFlow, navControllerAccountFlow]
        navControllerPostsFlow.tabBarItem = UITabBarItem(title: "posts",
                                                  image: UIImage(systemName: "ellipsis"),
                                                  tag: 1)
        navControllerAccountFlow.tabBarItem = UITabBarItem(title: "profile",
                                                  image: UIImage(systemName: "person.crop.circle"),
                                                  tag: 2)
        tabBarController.selectedViewController = navControllerAccountFlow
        return tabBarController
        
    }
    
}
