//
//  RouterProtocol.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

protocol RouterProtocol: AnyObject {
    
    func setRootModule(viewController: UIViewController)
    
    func push(viewController: UIViewController)
    func popModule(animated: Bool)
    
}

protocol CityUpdateble {
    
    func updateCity(cityName: String, isRated: Bool)
    
}


protocol RateUpdateble: AnyObject {
    
    func updateCity(cityName: String, isRated: Bool)
    
}
