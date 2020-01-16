//
//  Result.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(CustomError)
}
