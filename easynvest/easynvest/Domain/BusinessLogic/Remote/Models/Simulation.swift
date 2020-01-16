//
//  Simulation.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

struct Simulation: Codable {
  let investmentParameter: InvestmentParameter
  let grossAmount: Double
  let taxesAmount: Double
  let netAmount: Double
  let grossAmountProfit: Double
  let netAmountProfit: Double
  let annualGrossRateProfit: Double
  let monthlyGrossRateProfit: Double
  let dailyGrossRateProfit: Double
  let taxesRate: Double
  let rateProfit: Double
  let annualNetRateProfit: Double

  var investedAmount: Double {
    return investmentParameter.investedAmount
  }

  var rate: Double {
    return investmentParameter.rate
  }
}
