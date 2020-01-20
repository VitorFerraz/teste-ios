//
//  SimulationViewController.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 14/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

class SimulationViewController: AbstractMVVMController<SimulationViewModel> {
    let scrollView = UIScrollView()
    var currentTextField: UITextField?
    fileprivate lazy var overallStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountStackView, investimentDateStackView, rateDateStackView, simulateButton])
        stack.axis = .vertical
        stack.spacing = 21
        return stack
    }()
    fileprivate lazy var amountStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountLabel, amountTextField])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    fileprivate lazy var amountLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.text = "Quanto você gostaria de aplicar? *"
        label.isAccessibilityElement = true
        label.accessibilityTraits = UIAccessibilityTraits.none
        label.accessibilityLabel = "Quanto você gostaria de aplicar? *"

        return label
    }()

    fileprivate lazy var amountTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "R$"
        textField.keyboardType = .decimalPad
        textField.delegate = self
        textField.isAccessibilityElement = true
        textField.accessibilityTraits = UIAccessibilityTraits.searchField
        textField.accessibilityLabel = "Informe o valor para aplicar"
        return textField
    }()
    fileprivate lazy var investimentDateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [investimentDateLabel, investimentDateTextField])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()

    fileprivate lazy var rateLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.text = "Qual o percentual do CDI do investimento? *"
        label.isAccessibilityElement = true
        label.accessibilityTraits = UIAccessibilityTraits.none
        label.accessibilityLabel = "Qual o percentual do CDI do investimento? *"

        return label
    }()

    fileprivate lazy var rateTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "100%"
        textField.keyboardType = .decimalPad
        textField.delegate = self
        textField.isAccessibilityElement = true
        textField.accessibilityTraits = UIAccessibilityTraits.searchField
        textField.accessibilityLabel = "Informe o percentual do CDI do investimento"

        return textField
    }()
    fileprivate lazy var rateDateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [rateLabel, rateTextField])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()

    fileprivate lazy var investimentDateLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.text = "Qual a data de vencimento do investimento? *"
        label.isAccessibilityElement = true
        label.accessibilityTraits = UIAccessibilityTraits.none
        label.accessibilityLabel = "Qual a data de vencimento do investimento? *"

        return label
    }()

    fileprivate lazy var investimentDateTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "dia/mês/ano"
        textField.inputView = datePicker
        textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        textField.isAccessibilityElement = true
        textField.accessibilityTraits = UIAccessibilityTraits.searchField
        textField.accessibilityLabel = "Informe data dia/mês/ano"

        return textField
    }()

    fileprivate lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        datePicker.locale = Locale.current
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        return datePicker
    }()

    fileprivate lazy var simulateButton: RoundedButton = {
        let button = RoundedButton()
        button.setTitle("Simular", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
              button.addTarget(self, action: #selector(simulateTapped), for: .touchUpInside)
        button.isEnabled = false
        button.isAccessibilityElement = true
        button.accessibilityTraits = UIAccessibilityTraits.button
        button.accessibilityLabel = "Simular"

        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureBindings()
        setupNotificationObservers()
        setupTapGesture()
    }

    override func addViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(overallStackView)
    }

    // swiftlint:disable line_length
    override func setupConstraints() {
        scrollView.fillSuperviewSafeAreaLayoutGuide()
        overallStackView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: .init(top: 150, left: 25, bottom: 0, right: 25 ))
        simulateButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }

    @objc
    fileprivate func handleTextChange(textField: UITextField) {
        if textField == investimentDateTextField {
            viewModel.date.value = datePicker.date
        }
    }

    @objc
    fileprivate func datePickerChanged() {
        viewModel.date.value = datePicker.date
    }

    func configureBindings() {
        viewModel.isEnable.onMainThread().subscribe { [unowned self] isEnable in
            self.simulateButton.isEnabled = isEnable
        }
        viewModel.amount.onMainThread().subscribe { [unowned self] newAmount in
            self.amountTextField.text = newAmount.currencyFormat
            self.viewModel.checkForm()
        }
        viewModel.rate.onMainThread().subscribe { [unowned self] newRate in
            self.rateTextField.text = newRate.percentFormat
            self.viewModel.checkForm()
        }
        viewModel.date.onMainThread().subscribe {[unowned self]  newDate in
            if let date = newDate {
                self.investimentDateTextField.text = date.dateFormat
            }
            self.viewModel.checkForm()
        }

        viewModel.viewState.onMainThread().subscribe { [unowned self] state in
            switch state {
            case .loading:
                self.simulateButton.startAnimating()
            case .error(let customerError):
                self.simulateButton.stopAnimating()
                self.simulateButton.setTitle(customerError.description, for: .normal)
                self.simulateButton.backgroundColor = UIColor.EasyColor.errorButton
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.simulateButton.setTitle("Simular", for: .normal)
                    self.simulateButton.backgroundColor = UIColor.EasyColor.activeButton
                }
            case .success(let value):
                self.simulateButton.stopAnimating()
                guard let value = value else { return }
                self.viewModel.didSimulate(with: value)
            case .none:
                break
            }
        }
    }

    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
    }

    @objc
    fileprivate func handleTapDismiss() {
        self.view.endEditing(true) // dismisses keyboard
    }

    fileprivate func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self) // you'll have a retain cycle
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reset()
    }

    func reset() {
        rateTextField.text = nil
        amountTextField.text = nil
        investimentDateTextField.text = nil
        simulateButton.isEnabled = false
    }

    @objc
    fileprivate func handleKeyboardHide() {
       let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        // reset back the content inset to zero after keyboard is gone
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc
    fileprivate func handleKeyboardShow(notification: Notification) {
        // how to figure out how tall the keyboard actually is
       guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
           else { return }
           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height + 40, right: 0.0)
           scrollView.contentInset = contentInsets
           scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc
    fileprivate func simulateTapped() {
        handleTapDismiss()
        viewModel.simulate()
    }
}

// MARK: - UITextField Delegate
extension SimulationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.currentTextField = textField
        guard textField == investimentDateTextField else {
            return
        }
        viewModel.date.value = datePicker.date
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.currentTextField = nil
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        switch textField {
        case amountTextField:
            if string.isEmpty {
                let lastDigit = (viewModel.amount.value * 100).truncatingRemainder(dividingBy: 10)
                let newAmount: Double = ((viewModel.amount.value * 100 - lastDigit) / 10) / 100
                viewModel.amount.value = newAmount
            } else {
                let newDigit = Int(string) ?? 0
                let newAmount = (viewModel.amount.value * 100 * 10 + Double(newDigit)) / 100
                viewModel.amount.value = newAmount
            }
        case rateTextField:
            if string.isEmpty {
                let newRate: Double = viewModel.rate.value / 10
                viewModel.rate.value = newRate
            } else {
                let newRate = viewModel.rate.value * 10.0 + (Double(string) ?? 0.0)
                viewModel.rate.value = newRate
            }

        default:
            break
        }
        return false
    }
}
