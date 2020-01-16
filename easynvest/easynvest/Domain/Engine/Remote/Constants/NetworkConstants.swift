//
//  NetworkConstants.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

struct NetworkConstants {
    enum HTTPHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }

    enum ContentType {
        case json
        case formUrlEncoded
        case formData
        case bearer(String?)

        var rawValue: String {
            switch self {
            case .json:
                return "application/json"
            case .formUrlEncoded:
                return "application/x-www-form-urlencoded"
            case .formData:
                return "form-data"
            case .bearer(let token):
                guard let token = token else {
                    return ""
                }
                return "Bearer \(token)"
            }
        }
    }

    struct URLs {
        static var base: String {
            get {
                guard let stringURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
                    fatalError("Set your BASE_URL on info.plist")
                }
                return stringURL
            }
        }
    }
}
