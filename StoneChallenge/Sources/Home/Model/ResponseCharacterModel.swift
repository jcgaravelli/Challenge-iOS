//
//  ResponseCharacterModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import Foundation

// MARK: - ResponseCharacterModel
struct ResponseCharacterModel: Decodable {
    let info: Info
    let results: [CharacterModel]

    enum CodingKeys: CodingKey {
        case info
        case results
    }
}

// MARK: - Info
struct Info: Decodable {
    let count, pages: Int
    let next: String
    let prev: String?
}
