//
//  FilterType.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import Foundation

enum FilterType: Int {
    case alive = 1
    case dead
    case unknown
    
    var stringValue: String {
        switch self {
        case .alive:
            return "alive"
        case .dead:
            return "dead"
        case .unknown:
            return "unknown"
        }
    }
}
