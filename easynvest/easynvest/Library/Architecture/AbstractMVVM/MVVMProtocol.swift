//
//  MVVMProtocol.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
protocol MVVMProtocol: class {
    associatedtype T: ViewModelProtocol
    var viewModel: T { get }
    init()
}
