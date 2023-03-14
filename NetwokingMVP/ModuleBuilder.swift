//
//  ModuleBuilder.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let netService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: netService)
        view.presenter = presenter
        return view
        
    }
}
