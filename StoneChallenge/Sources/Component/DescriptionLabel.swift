//
//  DescriptionLabel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 03/07/23.
//

import UIKit

class DescriptionLabel: UILabel {

    var fontSize: CGFloat

    init(fontSize: CGFloat, identifier: String) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        self.accessibilityIdentifier = identifier
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.backgroundColor = .clear
        self.numberOfLines = 0
        self.textAlignment = .left
        self.textColor = .systemGreen
    }

    func setText(label: String, value: String) {
        self.attributedText = NSMutableAttributedString()
            .bold("\(label): ", fontSize: fontSize)
            .normal(value, fontSize: fontSize)
    }
}
