//
//  HomeViewModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

class HomeViewModel: NSObject {

    var coordinatorDelegate: HomeCoordinatorDelegate?

    var characterService: CharacterServiceProtocol?
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
    var pageRefreshing: (() -> Void)?
    var hideKeyboard: (() -> Void)?
    
    init(service: CharacterServiceProtocol = CharacterService()) {
        characterService = service
    }

    func viewWillAppear() {
        parseGetCharacters()
    }

    func didTapButton(_ tag: Int) {
        filter = FilterType(rawValue: tag)
    }
}
