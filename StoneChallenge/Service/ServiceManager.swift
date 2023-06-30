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
        let fullUrl = baseURL + path
        print(fullUrl)
        AF.request(fullUrl, method: .get).responseData { (response) in
            completion(response.data, response.error)
        }
    }
}
