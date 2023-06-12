//
//  SceneDelegate.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let mainNavigationController = UINavigationController()
        let appCoordinator = AppCoordinator(navigationController: mainNavigationController)
        appCoordinator.start()
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }
}

