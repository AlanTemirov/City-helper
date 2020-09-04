//
//  CityMainDataProvider.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityMainDataProvider: NSObject {
    
    var itemsProvider: CityMainItemsProvider!
    
    var onCitySelected: ItemClosure<CityModel>?
    
}

// MARK: - UITableViewDelegate
extension CityMainDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cityModel = itemsProvider.city(at: indexPath.row) {
            onCitySelected?(cityModel)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension CityMainDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsProvider.citiesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CityMainTableViewCell.identifier,
            for: indexPath) as? CityMainTableViewCell else {
                return UITableViewCell()
        }
        
        let model = itemsProvider.cities[indexPath.row]
        cell.configure(with: model)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        itemsProvider.sectionCount
    }
    
}
