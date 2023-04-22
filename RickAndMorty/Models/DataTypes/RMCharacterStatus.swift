//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 17.04.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive:
            return "Жив"
        case .dead:
            return "Мертв"
        case .unknown:
            return "Неизвестен"
        }
    }
}
