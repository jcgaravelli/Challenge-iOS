//
//  ServiceManager.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import Alamofire

class ServiceManager {
    
    private let baseURL = "https://rickandmortyapi.com/api/"
    
    func getCharacters(completion: @escaping ([CharacterModel]?, Error? ) -> Void) {
        let fullUrl = "\(baseURL)character"
        
        AF.request(fullUrl, method: .get).responseData { (response) in
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let dataCharacter = try decoder.decode(ResponseCharacterModel.self, from: data)
                completion(dataCharacter.results, nil)
            } catch let error {
                completion(nil, error)
                print("Error", error)
            }
        }
    }
}
