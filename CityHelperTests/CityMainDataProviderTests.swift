//
//  CityMainDataProviderTests.swift
//  CityHelperTests
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import XCTest
@testable import City_helper

class CityMainDataProviderTests: XCTestCase {
    
    var dataProvider: CityMainDataProvider!
    var itemsProviderMock: CityMainItemsProviderMock!
    var tableView: UITableView!
    var cityMainViewController: CityMainViewController!
    
    override func setUp() {
        super.setUp()
        
        dataProvider = CityMainDataProvider()
        itemsProviderMock = CityMainItemsProviderMock()
        
        cityMainViewController = CityMainAssembly.assemblyCityMain() as? CityMainViewController
        cityMainViewController.loadViewIfNeeded()
        
        tableView = cityMainViewController.tableView
        tableView.dataSource = dataProvider
    }
    
    override func tearDown() {
        super.tearDown()
        
        dataProvider = nil
        itemsProviderMock = nil
    }
    
    func testNumberOfRowsInSectionZeroIsItemsRowsCount() {
        // Given
        dataProvider.itemsProvider = itemsProviderMock
        
        // When
        let numberOfRowsInFirstSection = tableView.numberOfRows(inSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRowsInFirstSection, CityMainItemsProviderMock.defaultRowCount)
    }
    
    func testNumberOfRowsInSectionZeroChangesToItemsRowsCount() {
        // Given
        dataProvider.itemsProvider = itemsProviderMock
        itemsProviderMock.cities.removeLast()
        let count = itemsProviderMock.cities.count
        
        // When
        let numberOfRowsInFirstSection = tableView.numberOfRows(inSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRowsInFirstSection, count)
    }
    
    func testNumberOfSectionsIsItemsSectionsCount() {
        // Given
        dataProvider.itemsProvider = itemsProviderMock
        
        // When
        let numberOfSections = tableView.numberOfSections
        
        // Then
        XCTAssertEqual(numberOfSections, CityMainItemsProviderMock.defaultSectionCount)
    }
    
    func testCellForRowAtIndexPathReturnsCityMainCell() {
        // Given
        dataProvider.itemsProvider = itemsProviderMock
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CityMainTableViewCell.identifier,
            for: IndexPath(row: 0, section: 0)
        )
        // Then
        XCTAssertTrue(cell is CityMainTableViewCell)
    }
    
    func testCellForRowDequeuesCellsFromTableView() {
        // Given
        let mockTableView = MockTableView()
        dataProvider.itemsProvider = itemsProviderMock
        mockTableView.dataSource = dataProvider
        mockTableView.register(CityMainTableViewCell.nib, forCellReuseIdentifier: CityMainTableViewCell.identifier)
        // When
        mockTableView.reloadData()
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        // Then
        XCTAssertTrue(mockTableView.cellIsDequeued)
    }
    
}

// MARK: - Private
private extension CityMainDataProviderTests {
    
    class MockTableView: UITableView {
        
        var cellIsDequeued = false
        
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
    }
    
}
