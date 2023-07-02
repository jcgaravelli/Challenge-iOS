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
    var filterName: String? {
        didSet {
            self.reloadCollectionView?()
        }
    }

    var filteredCharacter: [CharacterModel] {
        if let filter {
            return character.filter { $0.status.lowercased() == filter.stringValue }
        }

        if let filterName, !filterName.isEmpty {
            return character.filter { $0.name.lowercased()
                .contains(filterName.lowercased()) }
        }
        return character
    }

    // MARK: Update View
    var reloadCollectionView: (() -> Void)?
    var scrollViewDidScroll: (() -> Void)?
    var searchBarTextDidBeginEditing: (() -> Void)?
    var searchBarCancelButtonClicked: (() -> Void)?

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
