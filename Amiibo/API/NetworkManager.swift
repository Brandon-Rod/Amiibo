//
//  NetworkManager.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import UIKit

protocol NetworkManagerProtocol {
    
    func request<T: Codable>(session: URLSession, _ endpoint: Endpoint, type: T.Type) async throws -> T
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
        
    private init() {}
    
    func request<T: Codable>(session: URLSession = .shared, _ endpoint: Endpoint, type: T.Type) async throws -> T {
        
        guard let url = endpoint.url else { throw AmiiboError.invalidURL }
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await session.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            
            throw AmiiboError.invalidResponse
            
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
        
    }
    
}

extension NetworkManager {
    
    enum AmiiboError: LocalizedError {
        
        case invalidURL, invalidResponse, invalidData, unableToComplete
        
    }
    
}

extension NetworkManager.AmiiboError: Error {
    
    var errorDescription: String? {
        
        var failureReason: String? {
            
            switch self {
                
            default:
                return Constants.serverError
                
            }
            
        }
        
        switch self {
            
        case .invalidURL:
            return Constants.invalidURL
            
        case .invalidResponse:
            return Constants.invalidResponse
            
        case .invalidData:
            return Constants.invalidData
            
        case .unableToComplete:
            return Constants.unableToComplete
            
        }
        
    }
    
}

