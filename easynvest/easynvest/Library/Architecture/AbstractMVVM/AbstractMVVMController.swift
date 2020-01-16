//
//  AbstractMVVMController.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

class AbstractMVVMController<ViewModel: ViewModelProtocol>: ViewController, MVVMProtocol {
    typealias ViewModel = ViewModel
    var viewModel: ViewModel

    convenience init(_ viewModel: ViewModel) {
        self.init()
        self.viewModel = viewModel
    }

    required public init() {
        viewModel = .init()
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        viewModel = .init()
        super.init(coder: aDecoder)
    }
}
