//
//  easynvestTests.swift
//  easynvestTests
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import XCTest
@testable import easynvest

class EasynvestTests: XCTestCase {
    var sut: SimulationViewModel!
    var delegate: SimulateCoordinatorDelegate!
    var didCallDelegate: Bool!
    override func setUp() {
        super.setUp()
        sut = SimulationViewModel(repository: SimulationStubRepository())
        delegate = self
        sut.delegate = delegate
        didCallDelegate = false
    }

    override func tearDown() {
        sut = nil
        delegate = nil
        didCallDelegate = nil
        super.tearDown()
    }

    func testLoadDataWithSuccess() {
        sut.amount.value = 10
        sut.date.value = Date()
        sut.rate.value = 10
        sut.simulate()

        sut.viewState.onMainThread().subscribe { (state) in

            switch state {
            case .success(let value):
                XCTAssertNotNil(value)
            default: break

            }
        }
    }

    func testCheckFormEmptyAmount() {
        sut.date.value = Date()
        sut.rate.value = 10
        sut.isEnable.onMainThread().subscribe { (status) in
            XCTAssertFalse(status)
        }

        sut.simulate()
    }

    func testCheckFormEmptyDate() {
        sut.amount.value = 10
        sut.date.value = nil
        sut.rate.value = 10
        sut.isEnable.onMainThread().subscribe { (status) in
            XCTAssertFalse(status)
        }

        sut.simulate()
    }

    func testCheckFormEmptyRate() {
        sut.amount.value = 10
        sut.date.value = Date()
        sut.isEnable.onMainThread().subscribe { (status) in
            XCTAssertFalse(status)
        }
        sut.simulate()
    }

    func testCheckValidForm() {
        sut.amount.value = 10
        sut.rate.value = 10
        sut.date.value = Date()
        sut.isEnable.onMainThread().subscribe { (status) in
            XCTAssertTrue(status)
        }

        sut.simulate()
    }

    func testDidCallDelegate() {
        sut.amount.value = 10
        sut.rate.value = 10
        sut.date.value = Date()
        sut.viewState.onMainThread().subscribe { (state) in
            switch state {
            case .success(let value):
                guard let value = value else {
                    XCTFail()
                    return
                }
                self.sut.didSimulate(with: value)
            default: break
            }
        }

        sut.simulate()
    }
}

extension EasynvestTests: SimulateCoordinatorDelegate {
    func didSimutale(simulation: Simulation) {
        didCallDelegate = true
        XCTAssertTrue(didCallDelegate)
    }

}
