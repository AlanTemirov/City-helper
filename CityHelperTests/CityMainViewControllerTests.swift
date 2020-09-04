//
//  CityMainViewControllerTests.swift
//  CityHelperTests
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import XCTest
@testable import City_helper

class CityMainViewControllerTests: XCTestCase {
    
    var assembly: CityMainAssembly!
    
    private lazy var cityMainViewController: CityMainViewController? = {
        guard let cityMainViewController = CityMainAssembly.assemblyCityMain() as? CityMainViewController else {
            XCTFail("sut is NOT CityMainViewController")
            return nil
        }
        
        return cityMainViewController
    }()
    
    override func setUp() {
        super.setUp()
        
        assembly = CityMainAssembly()
    }
    
    override func tearDown() {
        super.tearDown()
        
        assembly = nil
    }
    
    
    func testAssemblyReturnsCityMainViewController() {
        let sut = CityMainAssembly.assemblyCityMain()
        
        XCTAssertTrue(sut is CityMainViewController)
    }
    
    func testPresenterNotNilWhenAssemblyCompleted() {
        XCTAssertNotNil(cityMainViewController?.presenter)
    }
    
    
    func testTableViewNotNilWhenViewIsLoaded() {
        cityMainViewController?.loadViewIfNeeded()
        XCTAssertNotNil(cityMainViewController?.tableView)
    }
    
    func testDataProviderNotNilWhenAssemblyCompleted() {
        XCTAssertNotNil(cityMainViewController?.dataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        cityMainViewController?.loadViewIfNeeded()
        XCTAssertTrue(cityMainViewController?.tableView.delegate is CityMainDataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        cityMainViewController?.loadViewIfNeeded()
        XCTAssertTrue(cityMainViewController?.tableView.dataSource is CityMainDataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        cityMainViewController?.loadViewIfNeeded()
        
        XCTAssertEqual(
            cityMainViewController?.tableView.delegate as? CityMainDataProvider,
            cityMainViewController?.tableView.dataSource as? CityMainDataProvider
        )
    }
    
}

