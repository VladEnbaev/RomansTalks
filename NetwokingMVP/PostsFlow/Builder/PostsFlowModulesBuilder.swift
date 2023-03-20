//
//  ModuleBuilder.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit

protocol PostsFeedModulesBuilderProtocol {
    func createMainModule(router: PostsFeedFlowCoordinatorProtocol) -> UIViewController
    func createDetailPostModule(post: Post, router: PostsFeedFlowCoordinatorProtocol) -> UIViewController
}

class PostsFeedFlowModulesBuilder: PostsFeedModulesBuilderProtocol {
    
    func createMainModule(router: PostsFeedFlowCoordinatorProtocol) -> UIViewController {
        let view = MainViewController()
        let netService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: netService, router: router)
        view.presenter = presenter
        return view
        
    }
    func createDetailPostModule(post: Post, router: PostsFeedFlowCoordinatorProtocol) -> UIViewController {
        let view = DetailPostViewController()
        let netService = NetworkService()
        let presenter = DetailPostPresenter(view: view, networkService: netService, post: post)
        view.presenter = presenter
        return view
    }
}

