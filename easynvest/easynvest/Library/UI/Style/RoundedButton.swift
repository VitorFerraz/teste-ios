//
//  RoundedButton.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

final class RoundedButton: UIButton {
  override var isEnabled: Bool {
    didSet {
      refreshBackgroundColor()
    }
  }

  override var bounds: CGRect {
    didSet {
      layer.cornerRadius = bounds.height / 2
    }
  }

  init() {
    super.init(frame: .zero)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    setTitleColor(.white, for: .normal)
    addTarget(self, action: #selector(touchDown), for: .touchDown)
    addTarget(self, action: #selector(touchUp), for: .touchUpInside)
    addTarget(self, action: #selector(touchUp), for: .touchUpOutside)
    addTarget(self, action: #selector(touchUp), for: .touchCancel)
  }
}

// MARK: - Actions
extension RoundedButton {
  @objc
  func touchDown() {
    backgroundColor = backgroundColor?.withAlphaComponent(0.8)
  }

  @objc
  func touchUp() {
    refreshBackgroundColor()
  }
}

// MARK: - Private
private extension RoundedButton {
  func refreshBackgroundColor() {
    if isEnabled {
      backgroundColor = UIColor.EasyColor.activeButton
    } else {
      backgroundColor = UIColor.EasyColor.inactiveButton
    }
  }
}

// MARK: - Loading Protocol
extension RoundedButton: LoadingButton {}
