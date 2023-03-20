//
//  LoginFlowBuilder.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import Foundation
import UIKit

protocol LoginFlowBuilderProtocol {
    func createWelcomeModule(coordinator : LoginFlowCoordinatorProtocol) -> UIViewController
//    func createAccountCreationModule(coordinator: LoginFlowCoordinatorProtocol)
//    func createAdditionalInfoModule(coordinator: LoginFlowCoordinatorProtocol)
}

class LoginFlowBuilder : LoginFlowBuilderProtocol {
    func createWelcomeModule(coordinator: LoginFlowCoordinatorProtocol) -> UIViewController{
        let view = WelcomeViewController()
        let netService = NetworkService()
        let presenter = WelcomePresenter(view: view, networkService: netService, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
}

