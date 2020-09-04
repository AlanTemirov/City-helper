//
//  CityDetailProtocols.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
import MapKit

protocol CityDetailViewProtocol: AnyObject {
    
    var presenter: CityDetailPresenterProtocol! { get set }
    
    var onRateBtnTapped: ItemClosure<String>? { get set }
    
    var controller: UIViewController! { get }
    
}

protocol CityDetailPresenterProtocol {
    
    var view: CityDetailViewProtocol! { get set }
    
    func getCityName() -> String
    
    func getStringCoordinates() -> String
    
    func getCoordinates() -> CLLocationCoordinate2D?
    
}
