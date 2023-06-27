//
//  CharacterModel.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

struct CharacterModel: Codable {
    var id: Int?
    var name: String?
    var image: String?

    init(id: Int?, name: String?, image: String?){
        self.id = id
        self.name = name
        self.image = image
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
    }
}
