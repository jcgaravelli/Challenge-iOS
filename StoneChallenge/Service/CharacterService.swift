//
//  CharacterService.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 29/06/23.
//

import Foundation

class CharacterService: ServiceManager {

    var totalPage = 1
    var currentPage = 1

    var path: String {
        return "character/?page=\(currentPage)"
    }

    func getCharacters(_ completion: @escaping ([CharacterModel]?, Error?) -> Void) {

        guard totalPage >= currentPage - 1 else {
            completion([], nil)
            return
        }

        getRequest(path: path) { data, error in
            guard let data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let decoder = JSONDecoder()
                let dataCharacter = try decoder.decode(ResponseCharacterModel.self,
                                                       from: data)
                self.totalPage = dataCharacter.info.pages
                self.currentPage += 1

                completion(dataCharacter.results, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
}
