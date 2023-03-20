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
    func showLoginFlow()
    func showTabBarFlow(with user: User)
}

class AppCoordinator {
    func start() {
        
        let tabBarController = UITabBarController()
        
        let navControllerFlow2 = UINavigationController()
        
        let testVC = UIViewController()
        testVC.view.backgroundColor = .white
        testVC.title = "profile flow"
        
        
        navControllerFlow2.tabBarItem = UITabBarItem(title: "profile",
                                                     image: UIImage(systemName: "person.crop.circle"),
                                                     tag: 2)
        navControllerFlow2.viewControllers = [testVC]
    }
    
    func createPostsFlow() {
        
    }
}
