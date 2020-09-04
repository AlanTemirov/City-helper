//
//  SceneDelegate.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var appCoordinator: CoordinatorProtocol!
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        
        let rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        
        appCoordinator = AppCoordinator(router: Router(rootViewController: rootViewController),
                                        factory: CoordinatorFactory())
        appCoordinator.start()
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
}

