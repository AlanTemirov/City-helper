//
//  CityDetailAssembly.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityDetailAssembly {
    
    static func assemblyCityDetail(with cityModel: CityModel) -> CityDetailViewProtocol {
        let result = CityDetailViewController()
        let presenter = CityDetailPresenter()
        
        result.presenter = presenter
        
        presenter.view = result
        presenter.cityModel = cityModel
        
        return result
    }
    
}
