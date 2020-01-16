//
//  String+Utils.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 15/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
extension String {
    var doubleValue: Double {
        let styler = NumberFormatter()
        styler.minimumFractionDigits = 2
        styler.maximumFractionDigits = 2
        styler.numberStyle = .decimal
        
        let converter = NumberFormatter()
        converter.decimalSeparator = ","
        
        if let result = converter.number(from: self) {
            return result.doubleValue
        } else {
            converter.decimalSeparator = "."
            if let result = converter.number(from: self) {
                return result.doubleValue
            }
        }
        
        return 0.0
    }
}
