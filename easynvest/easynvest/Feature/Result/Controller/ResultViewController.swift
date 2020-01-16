//
//  ResultViewController.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 14/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

final class ResultViewController: AbstractMVVMController<ResultViewModel> {
    fileprivate lazy var overallStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [resultStackView, detailValueStackView, detailDateStackView, resetSimulateButton])
        stack.axis = .vertical
        stack.spacing = 31
        return stack
    }()
    fileprivate lazy var resultStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountTitleLabel, amountLabel, profitAmountLabel])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    fileprivate lazy var amountTitleLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.text = "Resultado da simulação"
        return label
    }()
    
    fileprivate lazy var amountLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = viewModel.amount
        return label
    }()
    
    fileprivate lazy var profitAmountLabel: HeaderLabel = {
        let label = HeaderLabel()
        let attr = NSMutableAttributedString()
        let str = NSAttributedString(string: "Rendimento total ")
        let amount = NSAttributedString(string: viewModel.profitAmount, attributes: [NSAttributedString.Key.foregroundColor: UIColor.EasyColor.activeButton])
        attr.append(str)
        attr.append(amount)
        label.attributedText = attr
        return label
    }()
    
    fileprivate lazy var detailValueStackView: UIStackView = {
        let initialValue = createLine(with: "Valor aplicado inicialmente", and: viewModel.initialValue)
        let grossInvestment = createLine(with: "Valor bruto do investimento", and: viewModel.initialValue)
        let incomeValue = createLine(with: "Valor do rendimento", and: viewModel.incomeValue)
        let incomeTax = createLine(with: "IR sobre investimento", and: viewModel.incomeTax)
        let netAmount = createLine(with: "Valor líquido do investimento", and: viewModel.netAmount)
        let stack = UIStackView(arrangedSubviews: [initialValue, grossInvestment, incomeValue, incomeTax, netAmount])
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    fileprivate lazy var detailDateStackView: UIStackView = {
        let maturityDate = createLine(with: "Data de resgate", and: viewModel.maturityDate)
        let maturityTotalDays = createLine(with: "Dias corridos", and: viewModel.maturityTotalDays)
        let monthlyGrossRateProfit = createLine(with: "Rendimento mensal", and: viewModel.monthlyGrossRateProfit)
        let rate = createLine(with: "Percentual CDI do investimento", and: viewModel.rate)
        let anualGross = createLine(with: "Rentabilidade anual", and: viewModel.anualGross)
        let rateProfit = createLine(with: "Rentabilidade no período", and: viewModel.rateProfit)
        let stack = UIStackView(arrangedSubviews: [maturityDate, maturityTotalDays, monthlyGrossRateProfit, rate, anualGross, rateProfit])
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    func createLine(with text: String, and value: String) -> UIStackView {
        let titleLabel = LineLabel()
        titleLabel.textAlignment = .left
        titleLabel.text = text
        let valueLabel = LineLabel()
        valueLabel.textAlignment = .right
        valueLabel.text = value

        let stack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stack.distribution = .equalSpacing
        return stack

    }
    
    fileprivate lazy var resetSimulateButton: RoundedButton = {
        let button = RoundedButton()
        button.setTitle("Simular novamente", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.addTarget(self, action: #selector(simulateTapped), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func addViewHierarchy() {
        view.addSubview(overallStackView)
    }
    
    // swiftlint:disable line_length
    override func setupConstraints() {
        overallStackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 4, bottom: 0, right: 4))
        overallStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        resetSimulateButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        
    }
    
    @objc fileprivate func simulateTapped() {
        self.navigationController?.popToRootViewController(animated: true)
        viewModel.reset()
    }
    
    
}
