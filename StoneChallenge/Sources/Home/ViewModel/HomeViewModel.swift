//
//  HomeViewModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

class HomeViewModel: NSObject {

    var coordinatorDelegate: HomeCoordinatorDelegate?

    var character: [CharacterModel] = []
    var filteredCharacter: [CharacterModel] = [] {
        didSet {
            self.reloadCollectionView?()
        }
    }
    var reloadCollectionView: (() -> Void)?

    func viewWillAppear() {
        parseGetCharacters()
    }

    func didTapButton(_ sender: UIButton) {
        let type = FilterType(rawValue: sender.tag)
        filter(by: type)
    }

    func filter(by type: FilterType?) {
        guard let type else { return }

        print("filter \(type)")
        filteredCharacter = character.filter { $0.status?.lowercased() == type.stringValue }
    }
}
