//
//  CityModel.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

class CityModel: Decodable {
    
    let name: String
    let detailInformation: String?
    let location: CityLocationModel?
    var isRated = false
    
    init(name: String,
         detailInformation: String? = nil,
         location: CityLocationModel? = nil) {
        self.name = name
        self.detailInformation = detailInformation
        self.location = location
    }
    
}

// MARK: - Equatable
extension CityModel: Equatable {
    
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        lhs.name == rhs.name && lhs.location == rhs.location
    }
    
}
