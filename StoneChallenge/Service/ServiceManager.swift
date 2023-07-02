//
//  ServiceManager.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 27/06/23.
//

import Alamofire

class ServiceManager {

    private let baseURL = "https://rickandmortyapi.com/api/"

    func getRequest(path: String, completion: @escaping ((Data?, Error?) -> Void)) {
        
        if !Connectivity.isConnectedToInternet,
           let data = try? StorageCache.retrieve(path) {
            print("pegou cache")
            completion(data, nil)
            return
        }

        let fullUrl = baseURL + path
        AF.request(fullUrl, method: .get).responseData { (response) in
            print("chamou api")
            if let data = response.data {
                print("salvou cache")
              _ = try? StorageCache.save(data, as: path)
            }
            completion(response.data, response.error)
        }
    }
}
