//
//  SimulationRepository.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 15/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

protocol SimulationRepository {
    func simulate(investment: SimulationParameters,_ completion: @escaping (Result<Simulation>) -> Void) 
}
