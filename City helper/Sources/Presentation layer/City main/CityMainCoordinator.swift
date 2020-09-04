//
//  CityMainCoordinator.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityMainCoordinator: BaseCoordinator, CoordinatorProtocol {
    
    private let cityRouter: CityRouter
    private let factory: ModulesFactory
    
    init(cityRouter: CityRouter, factory: ModulesFactory) {
        self.cityRouter = cityRouter
        self.factory = factory
    }
    
    func start() {
        showCityMainScreen()
    }
    
}

// MARK: - Private
private extension CityMainCoordinator {
    
    func showCityMainScreen() {
        let cityMainView = factory.makeCityMainView()
        
        cityMainView.onCitySelected = { [weak self] city in
            self?.showCityDetailScreen(with: city)
        }
        cityRouter.setRootModule(viewController: cityMainView.controller)
    }
    
    func showCityDetailScreen(with model: CityModel) {
        let cityDetailView = factory.makeCityDetailView(with: model)
        
        cityDetailView.onRateBtnTapped = { [weak self] cityName in
            self?.showCityRateScreen(with: cityName)
        }
        
        cityRouter.push(viewController: cityDetailView.controller)
    }
    
    func showCityRateScreen(with cityName: String) {
        guard let rateViewController =
            factory.makeCityRateView(with: cityName) as? CityRateViewController else {
                return
        }
        
        rateViewController.onRateAction = { [weak self] cityName, isRated in
            if !isRated {
                self?.cityRouter.popModule(animated: true)
            }
            
            self?.cityRouter.updateCity(cityName: cityName, isRated: isRated)
        }
        
        cityRouter.push(viewController: rateViewController)
    }
    
}
