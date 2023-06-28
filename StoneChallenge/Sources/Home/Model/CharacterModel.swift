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
    var status: String?
    
    var species: String?
    var type: String?
    var gender: String?

    init(id: Int?, name: String?, image: String?, status: String?, species: String?, type: String?, gender: String?){
        self.id = id
        self.name = name
        self.image = image
        self.status = status
        
        self.species = species
        self.type = type
        self.gender = gender
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
        case status = "status"
        
        case species = "species"
        case type = "type"
        case gender = "gender"
    }
}
