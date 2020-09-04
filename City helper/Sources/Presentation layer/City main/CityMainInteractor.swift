//
//  CityMainInteractor.swift
//  City helper
//
//  Created by Alan on 02.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

class CityMainInteractor: CityMainInteractorProtocol {
    
    private lazy var jsonReader = JsonReader()
    
    func obtainCities(completion: @escaping ItemsClosure<[CityModel]?, Error?>) {
        do {
            let cities = try jsonReader.readJSONFromFile(fileName: "data", type: [CityModel].self)
            completion(cities, nil)
        } catch {
            completion(nil, error)
        }
        
    }
    
}
