//
//  SimulationStubRepository.swift
//  easynvestTests
//
//  Created by Vitor Ferraz Varela on 16/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
@testable import easynvest

struct SimulationStubRepository: SimulationRepository {

    func simulate(investment: SimulationParameters, _ completion: @escaping (Result<Simulation>) -> Void) {
        // swiftlint:disable force_try
        let result = try! Simulation.fromJSON("SimulationMock") as Simulation
        completion(.success(result))
    }

}
