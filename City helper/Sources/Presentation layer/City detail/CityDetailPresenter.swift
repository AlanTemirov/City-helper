//
//  CityDetailPresenter.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
import MapKit

class CityDetailPresenter: CityDetailPresenterProtocol {
    
    weak var view: CityDetailViewProtocol!
    
    var cityModel: CityModel?
    
    func getCityName() -> String {
        cityModel?.name ?? ""
    }
    
    func getStringCoordinates() -> String {
        guard
            let latitude = cityModel?.location?.coordinate?.lat,
            let longitude = cityModel?.location?.coordinate?.lng
            else {
                return ""
        }
        
        return """
        \(latitude) \(longitude)
        """
    }
    
    func getCoordinates() -> CLLocationCoordinate2D? {
        cityModel?.location?.coordinate?.locationCoordinate()
    }
    
}
