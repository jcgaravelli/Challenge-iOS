//
//  Connectivity.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 01/07/23.
//

import Alamofire

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}
