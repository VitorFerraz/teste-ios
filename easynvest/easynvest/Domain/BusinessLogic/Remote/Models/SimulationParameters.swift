//
//  SimulationParameters.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct SimulationParameters: Codable {
  let investedAmount: Double
  let index: String = "CDI"
  let rate: Double
  let isTaxFree: Bool = false
  let maturityDate: String
}
