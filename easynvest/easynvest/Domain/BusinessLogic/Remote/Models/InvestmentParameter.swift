//
//  InvestmentParameter.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

struct InvestmentParameter: Codable {
  let investedAmount: Double
  let yearlyInterestRate: Double
  let maturityTotalDays: Int
  let maturityBusinessDays: Int
  let maturityDate: Date
  let rate: Double
  let isTaxFree: Bool
}
