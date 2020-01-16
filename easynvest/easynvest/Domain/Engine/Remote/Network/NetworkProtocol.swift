//
//  NetworkProtocol.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

typealias ResultCompletion<T> = (Result<T>) -> Void

protocol NetworkProtocol {
    associatedtype S: Service
    func request<T: Decodable>(service: S, result: @escaping ResultCompletion<T>)
}
