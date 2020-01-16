//
//  TextField.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

final class TextField: UITextField {
  static var underlineHeight: CGFloat {
    return 1
  }

  private lazy var underlineLayer: CALayer = {
    let layer = CALayer()
    layer.backgroundColor = UIColor.EasyColor.lightGray.cgColor
    return layer
  }()

  override var bounds: CGRect {
    didSet {
      underlineLayer.frame = CGRect(x: 0, y: bounds.height, width: bounds.width, height: TextField.underlineHeight)
    }
  }

    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 40)
    }

  init() {
    super.init(frame: .zero)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    layer.addSublayer(underlineLayer)
    font = UIFont.preferredFont(forTextStyle: .largeTitle)
    adjustsFontForContentSizeCategory = true
    textAlignment = .center
    textColor = UIColor.EasyColor.black
  }
}
