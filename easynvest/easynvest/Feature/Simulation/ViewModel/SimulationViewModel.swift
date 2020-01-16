//
//  SimulationViewModel.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 14/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
final class SimulationViewModel: ViewModelProtocol {

    var amount: Observable<Double>
    var date: Observable<Date?>
    var rate: Observable<Double>
    var isEnable: Observable<Bool>
    var viewState: Observable<ViewState<Simulation>?>
    fileprivate var repository: SimulationRepository
    weak var delegate: SimulateCoordinatorDelegate?
    required init() {
        amount = .init(0.0)
        date = .init(nil)
        rate = .init(0.0)
        isEnable = .init(false)
        viewState = .init(nil)
        repository = SimulationRemoteRepository()
    }

    convenience init(repository: SimulationRepository) {
        self.init()
        self.repository = repository
    }

    func checkForm() {
        let isFormValid = amount.value != 0.0 && rate.value != 0.0 && date.value != nil
        isEnable.value = isFormValid
    }

    func simulate() {
        guard let date = date.value?.networkDateFormat else { return }

        let investment = SimulationParameters.init(investedAmount: amount.value, rate: rate.value, maturityDate: date)
        viewState.value = .loading
        repository.simulate(investment: investment) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.viewState.value = .error(customerError: error)
            case .success(let simulation):
                self?.viewState.value = .success(value: simulation)
            }
        }
    }

    func didSimulate(with simulation: Simulation) {
        delegate?.didSimutale(simulation: simulation)
    }

}
