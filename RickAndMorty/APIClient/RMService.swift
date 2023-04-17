//
//  RMService.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 17.04.2023.
//

import Foundation

/// Primary API service object to get API data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privat init
    private init() {}
    
    /// Send API call
    /// - Parameters:
    ///   - request: request instance
    ///   - type : the type of object we expect to get back
    ///   - completion: callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
