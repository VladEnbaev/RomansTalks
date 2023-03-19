//
//  ModuleBuilder.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit

protocol Builder {
    func createMainModule(router: RouterFlowProtocol) -> UIViewController
    func createDetailPostModule(post: Post, router: RouterFlowProtocol) -> UIViewController
}

protocol TabBarBuilderProtocol {
    func createTabBar(flow1: Builder, flow2: Builder) -> UITabBarController
}

class ModuleBuilderFlow1: Builder {
    
    func createMainModule(router: RouterFlowProtocol) -> UIViewController {
        let view = MainViewController()
        let netService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: netService, router: router)
        view.presenter = presenter
        return view
        
    }
    func createDetailPostModule(post: Post, router: RouterFlowProtocol) -> UIViewController {
        let view = DetailPostViewController()
        let netService = NetworkService()
        let presenter = DetailPostPresenter(view: view, networkService: netService, post: post)
        view.presenter = presenter
        return view
    }
}

class ModuleBuilderFlow2: Builder {
    
    func createMainModule(router: RouterFlowProtocol) -> UIViewController {
        let view = MainViewController()
        let netService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: netService, router: router)
        view.presenter = presenter
        return view
        
    }
    func createDetailPostModule(post: Post, router: RouterFlowProtocol) -> UIViewController {
        let view = DetailPostViewController()
        let netService = NetworkService()
        let presenter = DetailPostPresenter(view: view, networkService: netService, post: post)
        view.presenter = presenter
        return view
    }
}
