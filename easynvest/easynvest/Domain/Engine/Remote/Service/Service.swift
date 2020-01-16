//
//  Service.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

protocol Service {
    var baseURL: URL { get }
    var path: String { get }
    var version: String? { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var auth: HTTPAuth? { get }
    var decoder: JSONDecoder { get }
    var timeoutInterval: RequestTimeInterval { get }
    func errorFor(statusCode: Int) -> CustomError?

}

extension Service {
    var timeoutInterval: RequestTimeInterval {
        return  RequestTimeInterval.long
    }
}
