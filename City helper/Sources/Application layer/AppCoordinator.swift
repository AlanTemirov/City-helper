//
//  AppCoordinator.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let router : CityRouter
    private let factory: CoordinatorFactory
    
    init(router: CityRouter, factory: CoordinatorFactory) {
        self.router  = router
        self.factory = factory
    }
}
 
// MARK:- Coordinatable
extension AppCoordinator: CoordinatorProtocol {
    
    func start() {
        let coordinator = factory.makeCityMainCoordinator(with: router)
        addDependency(coordinator)
        coordinator.start()
    }
    
}
