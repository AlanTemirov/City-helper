//
//  FailableDecodable.swift
//  City helper
//
//  Created by Alan on 02.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

struct FailableDecodable<Base: Decodable>: Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}
