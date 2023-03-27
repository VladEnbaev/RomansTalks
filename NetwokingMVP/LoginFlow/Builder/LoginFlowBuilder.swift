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
    func createRegistrationModule(coordinator: LoginFlowCoordinatorProtocol) -> UIViewController
    func createAdditionalInfoModule(coordinator : LoginFlowCoordinatorProtocol) -> UIViewController
}

class LoginFlowBuilder : LoginFlowBuilderProtocol {
    //hi
    func createWelcomeModule(coordinator: LoginFlowCoordinatorProtocol) -> UIViewController{
        let view = WelcomeViewController()
        let netService = NetworkService()
        let presenter = WelcomePresenter(view: view, networkService: netService, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
    
    func createRegistrationModule(coordinator: LoginFlowCoordinatorProtocol) -> UIViewController {
        let view = RegistrationViewController()
        let netService = NetworkService()
        let presenter = RegistrationPresenter(view: view, networkService: netService, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
    
    func createAdditionalInfoModule(coordinator: LoginFlowCoordinatorProtocol) -> UIViewController {
        let view = AdditionalInfoViewController()
        let netServise = NetworkService()
        let presenter = AdditionalInfoPresenter(view: view, networkService: netServise, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
}

