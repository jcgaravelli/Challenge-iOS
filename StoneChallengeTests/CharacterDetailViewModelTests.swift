//
//  CharacterDetailViewModelTests.swift
//  StoneChallengeTests
//
//  Created by Júlio Garavelli on 02/07/23.
//

import XCTest
@testable import StoneChallenge

class CharacterDetailViewModelTests: XCTestCase {

    func testSetup() {
        let character = CharacterModel(id: 1,
                                       name: "Rick Sanchez",
                                       image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                       status: "Alive",
                                       species: "Human",
                                       type: "",
                                       gender: "Male")
        let viewModel = CharacterDetailViewModel(characterDetailModel: character)

        XCTAssertEqual(viewModel.characterDetailModel, character)
    }
}
