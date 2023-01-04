//
//  ImageRetriever.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import Foundation

struct ImageRetriever {
    
    func fetchImage(_ url: String) async throws -> Data {
        
        guard let url = URL(string: url) else {
            
            throw RetrieveError.invalidURL
            
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
        
    }
    
}

private extension ImageRetriever {
    
    enum RetrieveError: Error {
        
        case invalidURL
        
    }
    
}
