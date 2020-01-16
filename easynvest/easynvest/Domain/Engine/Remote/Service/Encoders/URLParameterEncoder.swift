//
//  URLParameterEncoder.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

struct URLParameterEncoder: ParameterEncoderProtocol {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url: URL = urlRequest.url else {
            throw RequesterError.missingURL
        }

        if var urlComponents: URLComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = []
            parameters.forEach { (key, value) in
                let queryItem: URLQueryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }

        if urlRequest.value(forHTTPHeaderField: NetworkConstants.HTTPHeaderField.contentType.rawValue) == nil {
            urlRequest.setValue(NetworkConstants.ContentType.formUrlEncoded.rawValue + "; charset=utf-8",
                                forHTTPHeaderField: NetworkConstants.HTTPHeaderField.contentType.rawValue)
        }
    }
}
