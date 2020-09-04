//
//  ModulesFactory.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class ModulesFactory {}

// MARK: - CityMainFactoryProtocol
extension ModulesFactory: CityMainFactoryProtocol {
    
    func makeCityMainView() -> CityMainViewProtocol {
        CityMainAssembly.assemblyCityMain()
    }
    
}

// MARK: - CityDetailFactoryProtocol
extension ModulesFactory: CityDetailFactoryProtocol {
    
    func makeCityDetailView(with cityModel: CityModel) -> CityDetailViewProtocol {
        CityDetailAssembly.assemblyCityDetail(with: cityModel)
    }
    
}

// MARK: - CityRateFactoryProtocol
extension ModulesFactory: CityRateFactoryProtocol {
    
    func makeCityRateView(with cityName: String) -> UIViewController {
        CityRateAssembly.assemblyCityRate(with: cityName)
    }
    
}
