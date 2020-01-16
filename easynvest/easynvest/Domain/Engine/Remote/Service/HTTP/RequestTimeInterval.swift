//
//  RequestTimeInterval.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

enum RequestTimeInterval {
    case short
    case long
    case custom(value: Double)

    var value: Double {
        switch self {
        case .long:
            return 60.0
        case .short:
            return 30.0
        case .custom(let value):
            return value
        }
    }
}
