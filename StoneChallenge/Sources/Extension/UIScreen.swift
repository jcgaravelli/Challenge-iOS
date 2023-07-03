//
//  UIScreen.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 03/07/23.
//

import UIKit

extension UIScreen {
    var isLandscape: Bool {
        return self.bounds.width > self.bounds.height
    }
}
