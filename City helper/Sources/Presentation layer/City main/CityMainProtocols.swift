//
//  CityMainProtocols.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

protocol CityMainViewProtocol: AnyObject {
    
    var presenter: CityMainPresenterProtocol! { get set }
    
    var onCitySelected: ItemClosure<CityModel>? { get set }
    
    var controller: UIViewController! { get }
    
}

protocol CityMainPresenterProtocol {
    
    var view: CityMainViewProtocol! { get set }
    
    var interactor: CityMainInteractorProtocol! { get set }
    
    func onAppear()
    
    func updateCityModel(cityName: String, isRated: Bool)
    
}

protocol CityMainInteractorProtocol {
    
    func obtainCities(completion: @escaping ItemsClosure<[CityModel]?, Error?>)
    
}

protocol CityMainItemsProvider {
    
    var cities: [CityModel] { get }
    
    var citiesCount: Int { get }
    
    var sectionCount: Int { get }
    
    func city(at index: Int) -> CityModel?
    
}
