//
//  Router.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import UIKit


protocol RouterFlowProtocol {
    var navigationController : UINavigationController { get set }
    var moduleBuilder : Builder { get set }
    init (navigationController: UINavigationController, moduleBuilder: Builder)
    func initialViewController()
    func showDetail(with post: Post)
}


protocol TabBarRouterProtocol {
    var tabBarController : UITabBarController { get set }
    var routerFlow1 : RouterFlowProtocol { get set }
    var routerFlow2 : RouterFlowProtocol { get set }
    init (routerFlow1: RouterFlowProtocol, routerFlow2: RouterFlowProtocol)
}

//class TabBarRouter : TabBarRouterProtocol {
//    var tabBarController: UITabBarController
//    
//    var routerFlow1: RouterFlowProtocol
//    
//    var routerFlow2: RouterFlowProtocol
//    
//    required init(routerFlow1: RouterFlowProtocol, routerFlow2: RouterFlowProtocol) {
//        self.routerFlow1 = routerFlow1
//        self.routerFlow2 = routerFlow2
//    }
//}

class RouterFlow1 : RouterFlowProtocol{
    var navigationController: UINavigationController
    
    var moduleBuilder: Builder
    
    required init(navigationController: UINavigationController, moduleBuilder: Builder) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        let mainVC = moduleBuilder.createMainModule(router: self)
        navigationController.viewControllers = [mainVC]
    }
    
    func showDetail(with post: Post) {
        let detailPostVC = moduleBuilder.createDetailPostModule(post: post, router: self)
        navigationController.pushViewController(detailPostVC, animated: true)
    }
}


