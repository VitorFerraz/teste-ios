//
//  Decodable+FromJSON.swift
//  easynvestTests
//
//  Created by Vitor Ferraz Varela on 16/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

extension Decodable {
    static func fromJSON<T: Decodable>(_ fileName: String, fileExtension: String="json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(T.self, from: data)
    }
}
