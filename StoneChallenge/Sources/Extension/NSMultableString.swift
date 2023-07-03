//
//  NSMultableString.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 03/07/23.
//

import UIKit

extension NSMutableAttributedString {

    func bold(_ value:String, fontSize: CGFloat = 24) -> NSMutableAttributedString {

        let boldFont: UIFont = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes:[NSAttributedString.Key: Any] = [.font: boldFont]

        self.append(NSAttributedString(string: value,
                                       attributes:attributes))
        return self
    }

    func normal(_ value:String, fontSize: CGFloat = 24, foregroundColor: UIColor = .white) -> NSMutableAttributedString {
        
        let normalFont: UIFont = UIFont.systemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: normalFont,
                                                         .foregroundColor: foregroundColor.cgColor]

        self.append(NSAttributedString(string: value,
                                       attributes:attributes))
        return self
    }
}
