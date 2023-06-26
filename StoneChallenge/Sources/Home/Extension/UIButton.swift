//
//  UIButton.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

public extension UIButton {
    
    func configSelectionButton(tag: Int, identifier: String, text: String) {
        self.accessibilityIdentifier = identifier
        self.backgroundColor = .blue
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        self.sizeToFit()
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(text, for: .normal)
        self.tag = tag
    }
}
