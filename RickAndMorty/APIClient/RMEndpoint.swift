//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 17.04.2023.
//

import Foundation

/// Unique API endpoints
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
