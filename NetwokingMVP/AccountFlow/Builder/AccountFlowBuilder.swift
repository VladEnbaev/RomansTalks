//
//  AccountFlowBuilder.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import Foundation
import UIKit

protocol AccountFlowBuilderProtocol {
    func createAccountModule(coordinator : AccountFlowCoordinatorProtocol, user: User?) -> UIViewController
}

class AccountFlowBuilder : AccountFlowBuilderProtocol{
    func createAccountModule(coordinator: AccountFlowCoordinatorProtocol, user: User?) -> UIViewController {
        let view = AccountViewController()
        let netService = NetworkService()
        let presenter = AccountPresenter(user: user, view: view, networkService: netService, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
}
