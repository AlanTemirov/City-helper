//
//  ItemsProviderMock.swift
//  CityHelperTests
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
@testable import City_helper

class CityMainItemsProviderMock: CityMainItemsProvider {
    
    var cities: [CityModel] = [
        CityModel(name: "Foo", location: CityLocationModel(name: "Bar")),
        CityModel(name: "Baz", location: CityLocationModel(name: ""))
    ]

    static let defaultRowCount = 2
    static let defaultSectionCount = 1
    
    var citiesCount: Int { cities.count }
    
    var sectionCount: Int { CityMainItemsProviderMock.defaultSectionCount }
    
    func city(at index: Int) -> CityModel? {
        cities[index]
    }
    
}
