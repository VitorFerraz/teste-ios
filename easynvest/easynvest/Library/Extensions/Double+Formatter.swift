//
//  Double+Formatter.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 15/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

extension Double {
    var currencyFormat: String {
        return NumberFormatter.currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }

    var percentFormat: String {
        return NumberFormatter.percentageFormatter.string(for: self / 100) ?? ""
    }
}
