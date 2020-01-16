//
//  ViewState.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 15/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
enum ViewState<T> {
    case loading
    case success(value: T?)
    case error(CustomerError: CustomError)
}
