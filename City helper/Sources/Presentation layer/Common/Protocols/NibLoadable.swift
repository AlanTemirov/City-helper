//
//  NibLoadable.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

/// Assigning `NibLoadable` protocol helps to make work easy with init of `UINib`.
public protocol NibLoadableProtocol {
    
    /// Optional.
    static var nib: UINib { get }
    
    /// Optional.
    static var identifier: String { get }
    
}

public extension NibLoadableProtocol {
    
    /// Returns `UINib` with `identifier`.
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    /// Returns `String` identifier` describing `Self`.
    static var identifier: String {
        String(describing: self)
    }
    
}

