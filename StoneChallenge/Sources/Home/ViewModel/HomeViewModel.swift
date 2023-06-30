//
//  HomeViewModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

class HomeViewModel: NSObject {

    var coordinatorDelegate: HomeCoordinatorDelegate?

    var characterService: CharacterService?
    var character: [CharacterModel] = [] {
        didSet {
            self.reloadCollectionView?()
        }
    }

    // MARK: Filter
    var filter: FilterType? {
        didSet {
            self.reloadCollectionView?()
        }
    }
    var filteredCharacter: [CharacterModel] {
        guard let filter else { return character }
        return character.filter { $0.status?.lowercased() == filter.stringValue }
    }

    // MARK: Update View
    var reloadCollectionView: (() -> Void)?
    var scrollViewDidScroll: (() -> Void)?

    func viewDidLoad() {
        characterService = CharacterService()
    }

    func viewWillAppear() {
        parseGetCharacters()
    }

    func didTapButton(_ tag: Int) {
        filter = FilterType(rawValue: tag)
    }
}
