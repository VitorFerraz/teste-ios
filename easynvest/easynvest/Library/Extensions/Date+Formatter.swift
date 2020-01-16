//
//  Date+Formatter.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 15/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
extension Date {
    var dateFormat: String {
        return DateFormatter.formatter.string(from: self)
    }
    
    var networkDateFormat: String {
        return DateFormatter.networkFormat.string(from: self) 
    }
}
