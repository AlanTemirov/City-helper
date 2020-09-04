//
//  CityModelTests.swift
//  CityHelperTests
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import XCTest
@testable import City_helper

class CityModelTests: XCTestCase {

    func testInitCityModelWithName() {
        let city = CityModel(name: "Foo")
        
        XCTAssertNotNil(city)
    }
    
    func testInitCityModelWithNameAndDetailInformation() {
        let city = CityModel(name: "Foo", detailInformation: "Bar")
        
        XCTAssertNotNil(city)
    }
    
    func testWhenGivenNameSetsName() {
        let city = CityModel(name: "Foo")
        
        XCTAssertEqual(city.name, "Foo")
    }
    
    func testWhenGivenDetailInformationSetsDetailInformation() {
        let city = CityModel(name: "Foo", detailInformation: "Bar")
        
        XCTAssertTrue(city.detailInformation == "Bar")
    }
    
    func testWhenGivenLocationSetsLocation() {
        let cityLocation = CityLocationModel(name: "Foo")
        
        let city = CityModel(name: "Foo", detailInformation: "Bar", location: cityLocation)
        
        XCTAssertEqual(city.location, cityLocation)
    }

}
