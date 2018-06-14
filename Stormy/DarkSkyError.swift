//
//  DarkSkyError.swift
//  Stormy
//
//  Created by hardik Pans on 6/13/18.
//  Copyright © 2018 hardik. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidURL
    case jsonParsingFailure
}
