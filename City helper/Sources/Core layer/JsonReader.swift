//
//  JsonReader.swift
//  City helper
//
//  Created by Alan on 02.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

struct JsonReader {
    
    func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) throws -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                throw error
            }
        }
        return nil
    }
    
}
