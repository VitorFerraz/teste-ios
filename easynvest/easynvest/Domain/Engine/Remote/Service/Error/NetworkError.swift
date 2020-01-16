//
//  NetworkError.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

enum NetworkError: String, CustomError {
    case authentication = "You need to be authenticated first."
    case badRequest     = "Bad request."
    case outdated       = "The url that you requested is outdated."
    case failed         = "Network request failed."
    case noData         = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case connection     = "Connection failed."
    case castResponse   = "We could not do cast the response."
    case notFounded     = "We could not found the information."

    var description: String {
        return rawValue
    }
}
