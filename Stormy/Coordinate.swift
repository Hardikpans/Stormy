//
//  Coordinate.swift
//  Stormy
//
//  Created by hardik Pans on 6/14/18.
//  Copyright © 2018 hardik. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
}
