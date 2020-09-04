//
//  CityRateAssembly.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityRateAssembly {
    
    static func assemblyCityRate(with cityModelName: String) -> UIViewController {
        let result = CityRateViewController()
        result.cityModelName = cityModelName
        
        return result
    }
    
}
