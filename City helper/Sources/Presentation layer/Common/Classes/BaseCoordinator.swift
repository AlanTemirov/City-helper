//
//  BaseCoordinator.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

class BaseCoordinator {
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    /// Adding dependency to specific object.
    ///
    /// - Note: adds only unique object.
    ///
    /// - Parameter coordinator: The `CoordinatorProtocol` object to be used.
    func addDependency(_ coordinator: CoordinatorProtocol) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    /// Removing dependency of specific object.
    ///
    /// - Parameter coordinator: The `CoordinatorProtocol` object to be used. Optional.
    func removeDependency(_ coordinator: CoordinatorProtocol?) {
        guard
            !childCoordinators.isEmpty,
            let coordinator = coordinator
            else {
                return
        }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
