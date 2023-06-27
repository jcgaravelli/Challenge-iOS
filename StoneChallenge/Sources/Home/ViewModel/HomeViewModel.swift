//
//  HomeViewModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

class HomeViewModel: NSObject {

    var character: [CharacterModel] = []

    func viewWillAppear() {
        callService()
    }

    func didTapButton(_ sender: UIButton) {
        let type = FilterType(rawValue: sender.tag)
        filter(by: type)
    }

    func filter(by type: FilterType?) {
        guard let type else { return }

        print("filter \(type)")
        // filter model
    }
}
