//
//  CharacterDetailViewModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 29/06/23.
//

import UIKit

class CharacterDetailViewModel: NSObject {
    
    var characterDetailModel: CharacterModel
    
    init(characterDetailModel: CharacterModel) {
        self.characterDetailModel = characterDetailModel
    }
}
