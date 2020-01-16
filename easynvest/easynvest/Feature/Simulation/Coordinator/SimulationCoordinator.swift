//
//  SimulationCoordinator.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 14/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

protocol SimulateCoordinatorDelegate: class {
  func didSimutale(simulation: Simulation)
}

final class SimulationCoordinator: NSObject, Coordinator {
  let window: UIWindow
  var navigationController: UINavigationController!

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
    let viewController = SimulationViewController()
    viewController.viewModel.delegate = self
    navigationController = UINavigationController(rootViewController: viewController)
    navigationController.isNavigationBarHidden = true
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }

  func presentSimulation(_ simulation: Simulation) {
    let coordinator = ResultCoordinator(navigationController: navigationController, simulation: simulation)
    coordinator.start()
  }
}

extension SimulationCoordinator: SimulateCoordinatorDelegate {
  func didSimutale(simulation: Simulation) {
    presentSimulation(simulation)
  }
}
