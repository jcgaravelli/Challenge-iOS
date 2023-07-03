//
//  MockCharacterService.swift
//  StoneChallengeTests
//
//  Created by Júlio Garavelli on 02/07/23.
//

import XCTest
@testable import StoneChallenge

class MockCharacterService: CharacterServiceProtocol {
    func getCharacters(_ completion: @escaping ([CharacterModel]?, Error?) -> Void) {
        
        let characterModel = [CharacterModel(id: 1, name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", status: "Alive", species: "Human", type: "", gender: "Male"),
                              CharacterModel(id: 2, name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", status: "Alive", species: "Human", type: "", gender: "Male"),
                              CharacterModel(id: 3, name: "Summer Smith", image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg", status: "Alive", species: "Human", type: "", gender: "Female"),
                              CharacterModel(id: 4, name: "Beth Smith", image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg", status: "Alive", species: "Human", type: "", gender: "Female"),
                              CharacterModel(id: 5, name: "Jerry Smith", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg", status: "Alive", species: "Human", type: "", gender: "Male"),
                              CharacterModel(id: 6, name: "Abadango Cluster Princess", image: "https://rickandmortyapi.com/api/character/avatar/6.jpeg", status: "Alive", species: "Alien", type: "", gender: "Female"),
                              CharacterModel(id: 7, name: "Abradolf Lincler", image: "https://rickandmortyapi.com/api/character/avatar/7.jpeg", status: "unknown", species: "Human", type: "Genetic experiment", gender: "Male"),
                              CharacterModel(id: 8, name: "Adjudicator Rick", image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg", status: "Dead", species: "Human", type: "", gender: "Male"),
                              CharacterModel(id: 9, name: "Agency Director", image: "https://rickandmortyapi.com/api/character/avatar/9.jpeg", status: "Dead", species: "Human", type: "", gender: "Male"),
                              CharacterModel(id: 10, name: "Alan Rails", image: "https://rickandmortyapi.com/api/character/avatar/10.jpeg", status: "Dead", species: "Human", type: "Superhuman (Ghost trains summoner)", gender: "Male"),
                              CharacterModel(id: 11, name: "Albert Einstein", image: "https://rickandmortyapi.com/api/character/avatar/11.jpeg", status: "Dead", species: "Human", type: "", gender: "Male"),
                              CharacterModel(id: 12, name: "Alexander", image: "https://rickandmortyapi.com/api/character/avatar/12.jpeg", status: "Dead", species: "Human", type: "", gender: "Male"),
                              CharacterModel(id: 13, name: "Alien Googah", image: "https://rickandmortyapi.com/api/character/avatar/13.jpeg", status: "unknown", species: "Alien", type: "", gender: "unknown"),
                              CharacterModel(id: 14, name: "Alien Morty", image: "https://rickandmortyapi.com/api/character/avatar/14.jpeg", status: "unknown", species: "Alien", type: "", gender: "Male"),
                              CharacterModel(id: 15, name: "Alien Rick", image: "https://rickandmortyapi.com/api/character/avatar/15.jpeg", status: "unknown", species: "Alien", type: "", gender: "Male"),
                              CharacterModel(id: 16, name: "Amish Cyborg", image: "https://rickandmortyapi.com/api/character/avatar/16.jpeg", status: "Dead", species: "Alien", type: "Parasite", gender: "Male"),
                              CharacterModel(id: 17, name: "Annie", image: "https://rickandmortyapi.com/api/character/avatar/17.jpeg", status: "Alive", species: "Human", type: "", gender: "Female"),
                              CharacterModel(id: 18, name: "Antenna Morty", image: "https://rickandmortyapi.com/api/character/avatar/18.jpeg", status: "Alive", species: "Human", type: "Human with antennae", gender: "Male"),
                              CharacterModel(id: 19, name: "Antenna Rick", image: "https://rickandmortyapi.com/api/character/avatar/19.jpeg", status: "unknown", species: "Human", type: "Human with antennae", gender: "Male"),
                              CharacterModel(id: 20, name: "Ants in my Eyes Johnson", image: "https://rickandmortyapi.com/api/character/avatar/20.jpeg", status: "unknown", species: "Human", type: "Human with ants in his eyes", gender: "Male")]
        
        completion(characterModel, nil)
    }
}
