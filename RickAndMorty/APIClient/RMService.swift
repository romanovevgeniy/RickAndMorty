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
    static let shared = RMRequest()
    
    /// Privat init
    private init() {}
    
    /// Send API call
    /// - Parameters:
    ///   - request: request instance
    ///   - completion: callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
