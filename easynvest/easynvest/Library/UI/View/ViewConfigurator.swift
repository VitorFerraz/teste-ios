//
//  ViewConfigurator.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

protocol ViewConfigurator: class {
    func setup()
    func addViewHierarchy()
    func setupConstraints()
}

extension ViewConfigurator {
    func setup() {
        addViewHierarchy()
        setupConstraints()
    }
}
