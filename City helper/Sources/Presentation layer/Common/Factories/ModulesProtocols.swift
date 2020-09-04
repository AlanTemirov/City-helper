//
//  ModulesProtocols.swift
//  City helper
//
//  Created by Alan on 02.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

protocol CityMainFactoryProtocol {
    
    func makeCityMainView() -> CityMainViewProtocol
    
}

protocol CityDetailFactoryProtocol {
    
    func makeCityDetailView(with cityModel: CityModel) -> CityDetailViewProtocol
    
}

protocol CityRateFactoryProtocol {
    
    func makeCityRateView(with cityName: String) -> UIViewController
    
}
