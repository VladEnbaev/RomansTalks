//
//  Router.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import UIKit


protocol PostsFeedFlowCoordinatorProtocol {
    var navigationController : UINavigationController { get set }
    var moduleBuilder : PostsFeedModulesBuilderProtocol { get set }
    init (navigationController: UINavigationController, moduleBuilder: PostsFeedModulesBuilderProtocol)
    func start()
    func showDetail(with post: Post)
}


class PostsFeedFlowCoordinator : PostsFeedFlowCoordinatorProtocol{
    var navigationController: UINavigationController
    
    var moduleBuilder: PostsFeedModulesBuilderProtocol
    
    required init(navigationController: UINavigationController, moduleBuilder: PostsFeedModulesBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func start() {
        let mainVC = moduleBuilder.createMainModule(router: self)
        navigationController.viewControllers = [mainVC]
    }
    
    func showDetail(with post: Post) {
        let detailPostVC = moduleBuilder.createDetailPostModule(post: post, router: self)
        navigationController.pushViewController(detailPostVC, animated: true)
    }
}


