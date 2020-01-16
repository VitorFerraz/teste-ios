//
//  ResultViewModelTests.swift
//  easynvestTests
//
//  Created by Vitor Ferraz Varela on 16/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import XCTest
@testable import easynvest

class ResultViewModelTests: XCTestCase {
    var sut: ResultViewModel!
    var didCallDelegate: Bool!
    override func setUp() {
        super.setUp()
        sut = ResultViewModel.init()
        // swiftlint:disable force_try
        let simulation = try! Simulation.fromJSON("SimulationMock") as Simulation
        sut.simulation = simulation
        sut.delegate = self
        didCallDelegate = false

    }

    override func tearDown() {
        sut = nil
    }

    func testFormattedData() {
        XCTAssertEqual(sut.amount, "R$ 100,62")
        XCTAssertEqual(sut.profitAmount, "R$ 0,62")
        XCTAssertEqual(sut.initialValue, "R$ 100,00")
        XCTAssertEqual(sut.grossInvestment, "R$ 100,62")
        XCTAssertEqual(sut.incomeValue, "R$ 0,62")
        XCTAssertEqual(sut.incomeTax, "R$ 0,12 (20%)")
        XCTAssertEqual(sut.netAmount, "R$ 100,50")
        XCTAssertEqual(sut.maturityDate, "16/12/2020")
        XCTAssertEqual(sut.maturityTotalDays, "335")
        XCTAssertEqual(sut.monthlyGrossRateProfit, "0.46%")
        XCTAssertEqual(sut.rate, "12%")
        XCTAssertEqual(sut.anualGross, "0.62%")
        XCTAssertEqual(sut.rateProfit, "5.7%")
    }

    func testDidCallDelegate() {
        sut.reset()
    }
}

extension ResultViewModelTests: ResultCoordinatorDelegate {
    func didTapReset() {
        didCallDelegate = true
        XCTAssertTrue(didCallDelegate)
    }
}
