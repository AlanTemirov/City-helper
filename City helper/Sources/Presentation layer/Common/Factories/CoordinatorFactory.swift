//
//  CoordinatorFactory.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

class CoordinatorFactory {
    
    private lazy var modulesFactory = ModulesFactory()
    
    func makeCityMainCoordinator(with router: CityRouter) -> CoordinatorProtocol {
        let result = CityMainCoordinator(cityRouter: router, factory: modulesFactory)
        return result
    }
    
}
