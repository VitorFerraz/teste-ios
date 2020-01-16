//
//  RouterProtocol.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

typealias RouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol RouterProtocol: class {
    associatedtype S: Service
    func perform(_ service: S, completion: @escaping RouterCompletion)
    func buildRequestFrom(_ service: S) throws -> URLRequest
    func cancel()
}
