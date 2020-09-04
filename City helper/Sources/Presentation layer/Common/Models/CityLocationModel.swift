//
//  CityLocationModel.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
import CoreLocation

struct CityLocationModel: Decodable {
    
    let name: String
    let coordinate: CityCoordinateModel?
    
    init(name: String, coordinate: CityCoordinateModel? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
    
}

// MARK: - Equatable
extension CityLocationModel: Equatable {
    static func == (lhs: CityLocationModel, rhs: CityLocationModel) -> Bool {
        guard
            lhs.coordinate?.lat == rhs.coordinate?.lat &&
                lhs.coordinate?.lng == rhs.coordinate?.lng &&
                lhs.name == rhs.name
            else {
                return false
        }
        
        return true
    }
    
}
