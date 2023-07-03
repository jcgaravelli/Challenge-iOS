//
//  SelectionButton.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 02/07/23.
//

import UIKit

class SelectionButton: UIButton {

    var actionButton: ((UIButton) -> Void)?

    override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setup() {
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConfig(tag: Int,
                     identifier: String,
                     text: String,
                     isSelected: Bool = false,
                     actionButton: ((UIButton) -> Void)?) {
        self.tag = tag
        self.accessibilityIdentifier = identifier
        self.setTitle(text, for: .normal)
        self.isSelected = isSelected
        self.actionButton = actionButton
        self.backgroundColor = .systemGreen
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.sizeToFit()
        self.titleLabel?.textColor = .black
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.setTitleColor(.systemPink, for: .selected)
        self.addTarget(self,
                       action: #selector(didTapButton),
                       for: .touchUpInside)
    }

    @objc func didTapButton(sender: UIButton) {
        actionButton?(sender)
    }
}
