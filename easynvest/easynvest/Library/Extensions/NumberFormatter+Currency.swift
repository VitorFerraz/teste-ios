//
//  NumberFormatter+Currency.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 15/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

enum CurrencySymbol: String {
    case ptBR = "R$"
}

extension NumberFormatter {
    convenience init(numberStyle: Style) {
        self.init()
        self.numberStyle = numberStyle
    }

    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter(numberStyle: .currency)
        if #available(iOS 12.0, *) {
            formatter.currencySymbol = CurrencySymbol.ptBR.rawValue
        } else {
            formatter.currencySymbol = CurrencySymbol.ptBR.rawValue + " "
        }
        formatter.allowsFloats = true
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }
}
