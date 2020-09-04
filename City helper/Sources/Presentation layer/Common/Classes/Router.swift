//
//  Router.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

typealias CityRouter = RouterProtocol & CityUpdateble

class Router: RouterProtocol {
    
    let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func setRootModule(viewController: UIViewController) {
        rootViewController.setViewControllers([viewController], animated: false)
    }
    
    func push(viewController: UIViewController) {
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    func popModule(animated: Bool) {
        rootViewController.popViewController(animated: animated)
    }
    
}

extension Router: CityUpdateble {
    
    func updateCity(cityName: String, isRated: Bool) {
        rootViewController.viewControllers.forEach {
            ($0 as? RateUpdateble)?.updateCity(cityName: cityName, isRated: isRated)
        }
    }
    
}
