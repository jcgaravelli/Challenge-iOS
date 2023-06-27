//
//  ResponseCharacterModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import Foundation

// MARK: - ResponseCharacterModel
struct ResponseCharacterModel: Codable {
    let info: Info
    let results: [CharacterModel]

    enum CodingKeys: CodingKey {
        case info
        case results
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)

        self.info = try container.decode(Info.self, forKey: .info)
        self.results = try container.decode([CharacterModel].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<CodingKeys> = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.info, forKey: .info)
        try container.encode(self.results, forKey: .results)
    }
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}
