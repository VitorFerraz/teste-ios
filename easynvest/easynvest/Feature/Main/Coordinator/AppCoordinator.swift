//
//  AppCoordinator.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 14/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

final class AppCoordinator: NSObject, Coordinator {
  let window: UIWindow

  var coordinators: [Coordinator] = []

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
    let coordinator = SimulationCoordinator(window: window)
    coordinators.append(coordinator)
    coordinator.start()
  }
}
