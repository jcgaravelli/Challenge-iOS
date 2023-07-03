//
//  StackView.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import Foundation
import UIKit

extension UIStackView {
    static func setupStackView(arrangedSubviews: [UIView],
                               axis: NSLayoutConstraint.Axis = .horizontal,
                               alignment: UIStackView.Alignment = .fill,
                               distribution: UIStackView.Distribution = .fill,
                               spacing: CGFloat = 0,
                               clipsToBounds: Bool = true,
                               translatesAutoresizingMaskIntoConstraints: Bool = false ) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.clipsToBounds = clipsToBounds
        stackView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        return stackView
    }
}
