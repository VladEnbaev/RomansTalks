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
        
        let tabBarController = UITabBarController()
        let navControllerFlow1 = UINavigationController()
        let navControllerFlow2 = UINavigationController()
        let moduleBuilderFlow1 = ModuleBuilderFlow1()
        let moduleBuilderFlow2 = ModuleBuilderFlow2()
    
        let routerFlow1 = RouterFlow1(navigationController: navControllerFlow1, moduleBuilder: moduleBuilderFlow1)
        let routerFlow2 = RouterFlow1(navigationController: navControllerFlow2, moduleBuilder: moduleBuilderFlow2)
        routerFlow2.initialViewController()
        routerFlow1.initialViewController()
        tabBarController.viewControllers = [navControllerFlow1, navControllerFlow2]
        navControllerFlow1.tabBarItem = UITabBarItem(title: "posts",
                                                     image: UIImage(systemName: "ellipsis"),
                                                     tag: 1)
        navControllerFlow2.tabBarItem = UITabBarItem(title: "profile",
                                                     image: UIImage(systemName: "person.crop.circle"),
                                                     tag: 2)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
