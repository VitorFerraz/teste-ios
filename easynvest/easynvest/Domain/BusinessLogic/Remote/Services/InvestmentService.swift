//
//  InvestmentService.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 14/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

enum InvestmentService {
    case calculatorSimulate(investment: SimulationParameters)
}

extension InvestmentService: Service {

    var baseURL: URL {
        guard let url = URL(string: NetworkConstants.URLs.base) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }

    var path: String {
        return "/calculator/simulate"
    }

    var version: String? {
        return nil
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .calculatorSimulate(let simulation):
            return HTTPTask.requestWith(urlParameters: simulation.dictionary, bodyParameters: nil)
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }

    var auth: HTTPAuth? {
        return nil
    }

    var decoder: JSONDecoder {
         let decoder = JSONDecoder()
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
         decoder.dateDecodingStrategy = .formatted(dateFormatter)
         return decoder
    }

    func errorFor(statusCode: Int) -> CustomError? {
        return nil
    }
}
