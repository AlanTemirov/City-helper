//
//  CityCoordinate.swift
//  City helper
//
//  Created by Alan on 02.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
import CoreLocation

struct CityCoordinateModel: Decodable {
    let lat: Double
    let lng: Double
    
    func locationCoordinate() -> CLLocationCoordinate2D {
        .init(latitude: lat,
              longitude: lng)
    }
}
