//
//  ResultCoordinator.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 14/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

protocol ResultCoordinatorDelegate: class {
    func didTapReset()
}

final class ResultCoordinator: NSObject, Coordinator {
    let navigationController: UINavigationController
    let simulation: Simulation

    init(navigationController: UINavigationController, simulation: Simulation) {
        self.navigationController = navigationController
        self.simulation = simulation
    }

    func start() {
        DispatchQueue.main.async {
            let viewController = ResultViewController()
            viewController.viewModel.delegate = self
            viewController.viewModel.simulation = self.simulation
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
}

extension ResultCoordinator: ResultCoordinatorDelegate {
    func didTapReset() {
        self.navigationController.popToRootViewController(animated: true)
    }
}
