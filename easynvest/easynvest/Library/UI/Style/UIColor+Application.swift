//
//  UIColor+Application.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 13/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

extension UIColor {
  struct EasyColor {
    static var black: UIColor {
      return #colorLiteral(red: 0, green: 0.01946237497, blue: 0.06982132047, alpha: 1)
    }

    static var lightGray: UIColor {
      return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }

    static var activeButton: UIColor {
      return #colorLiteral(red: 0.337254902, green: 0.7725490196, blue: 0.7019607843, alpha: 1)
    }

    static var inactiveButton: UIColor {
      return #colorLiteral(red: 0.768627451, green: 0.7921568627, blue: 0.7882352941, alpha: 1)
    }
    static var errorButton: UIColor {
      return #colorLiteral(red: 0.7921568627, green: 0.195389967, blue: 0.2099622628, alpha: 1)
    }
  }
}
