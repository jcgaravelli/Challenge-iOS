//
//  HomeViewModel+Service.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import Foundation

extension HomeViewModel {
    
    func parseGetCharacters() {
        // get character
        guard character.isEmpty else {
            return
        }
        
        ServiceManager().getCharacters() { (character, error) in
            guard let character: [CharacterModel] = character else {
                return
            }
            self.character = character
            self.filteredCharacter = character
        }
    }
}
