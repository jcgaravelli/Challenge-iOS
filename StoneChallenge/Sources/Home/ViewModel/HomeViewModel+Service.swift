//
//  HomeViewModel+Service.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import Foundation

extension HomeViewModel {

    func parseGetCharacters(nextPage: Bool = false) {
        guard character.isEmpty || nextPage else {
            return
        }
        characterService?.getCharacters { [weak self] (character, error) in
            guard let character: [CharacterModel] = character else {
                return
            }
            self?.character.append(contentsOf: character)
        }
    }
}
