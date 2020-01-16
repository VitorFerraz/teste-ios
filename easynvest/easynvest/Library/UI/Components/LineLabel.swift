//
//  LineLabel.swift
//  easynvest
//
//  Created by Vitor Ferraz Varela on 16/01/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

class LineLabel: UILabel {
    override init(frame: CGRect) {
         super.init(frame: frame)
         setup()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     override func drawText(in rect: CGRect) {
         super.drawText(in: rect.insetBy(dx: 16, dy: 0))
     }

    func setup() {
        font = UIFont.preferredFont(forTextStyle: .footnote)
        adjustsFontForContentSizeCategory = true
        textColor = UIColor.EasyColor.black
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}
