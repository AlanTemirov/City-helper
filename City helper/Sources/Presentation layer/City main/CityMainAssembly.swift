//
//  CityMainAssembly.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityMainAssembly {
    
    static func assemblyCityMain() -> CityMainViewProtocol {
        let result = CityMainViewController()
        let presenter = CityMainPresenter()
        let dataProvider = CityMainDataProvider()
        let interactor = CityMainInteractor()
        
        result.dataProvider = dataProvider
        result.presenter = presenter
        
        presenter.view = result
        presenter.interactor = interactor
        
        dataProvider.itemsProvider = presenter
        
        return result
    }
    
}
