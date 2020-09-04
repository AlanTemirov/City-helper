//
//  CityLocationModelTests.swift
//  CityHelperTests
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import XCTest
import CoreLocation
@testable import City_helper

class CityLocationModelTests: XCTestCase {
    
    func testInitSetsName() {
        let city = CityLocationModel(name: "Foo")
        
        XCTAssertEqual(city.name, "Foo")
    }
    
    func testInitSetsCoordinate() {
        let coordinate = CityCoordinateModel(
            lat: 1,
            lng: 2
        )
        
        let location = CityLocationModel(name: "Foo", coordinate: coordinate)
        
        XCTAssertEqual(coordinate.lat, location.coordinate?.lat)
        XCTAssertEqual(coordinate.lng, location.coordinate?.lng)
    }
    
}
