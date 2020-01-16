//
//  DateFormatter+Formatter.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 15/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var formatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }

    static var networkFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
}
