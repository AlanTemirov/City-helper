//
//  CityMainPresenter.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
import CoreLocation

class CityMainPresenter: CityMainPresenterProtocol {
    
    weak var view: CityMainViewProtocol!
    
    var interactor: CityMainInteractorProtocol!
    
    private(set) var cities: [CityModel] = []
    
    func onAppear() {
        getCities()
    }
    
    func updateCityModel(cityName: String, isRated: Bool) {
        cities.first(where: { $0.name == cityName })?.isRated = isRated
    }
    
}

// MARK: - CityMainItemsProvider
extension CityMainPresenter: CityMainItemsProvider {
    
    var citiesCount: Int {
        cities.count
    }
    
    var sectionCount: Int {
        CityMainSections.allCases.count
    }
    
    func city(at index: Int) -> CityModel? {
        guard cities.indices.contains(index) else { return nil }
        return cities[index]
    }
    
}

// MARK: - Private
private extension CityMainPresenter {
    
    enum CityMainSections: CaseIterable { case
        allCities
    }
    
    func getCities() {
        interactor.obtainCities { cities, _ in
            if let cities = cities {
                self.cities = cities
            }
        }
    }
    
}
