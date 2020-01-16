//
//  ResultViewModel.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 16/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
final class ResultViewModel: ViewModelProtocol {
    var simulation: Simulation?
    weak var delegate: ResultCoordinatorDelegate?
    var amount: String  {
        return simulation?.grossAmount.currencyFormat ?? ""
    }
    
    var profitAmount: String  {
        return simulation?.grossAmountProfit.currencyFormat ?? ""
    }
    
    var initialValue: String {
        return simulation?.investmentParameter.investedAmount.currencyFormat ?? ""
    }
    
    var grossInvestment: String {
        return simulation?.grossAmount.currencyFormat ?? ""
    }
    
    var incomeValue: String {
        return simulation?.grossAmountProfit.currencyFormat ?? ""
    }
    
    var incomeTax: String {
        let value = simulation?.taxesAmount.currencyFormat ?? ""
        let tax = simulation?.taxesRate.percentFormat ?? ""
        return "\(value) (\(tax))"
    }
    
    var netAmount: String {
        return simulation?.netAmount.currencyFormat ?? ""
    }
    
    var maturityDate: String {
        return simulation?.investmentParameter.maturityDate.dateFormat ?? ""
    }
    
    var maturityTotalDays: String {
        return String(simulation?.investmentParameter.maturityTotalDays ?? 0)
    }
    var monthlyGrossRateProfit: String {
        return simulation?.monthlyGrossRateProfit.percentFormat ?? ""
    }
    
    var rate: String {
        return simulation?.rate.percentFormat ?? ""
    }
    
    var anualGross: String {
        return simulation?.annualGrossRateProfit.percentFormat ?? ""
    }
    
    var rateProfit: String {
        return simulation?.rateProfit.percentFormat ?? ""
    }
    
    func reset() {
        delegate?.didTapReset()
    }
}
