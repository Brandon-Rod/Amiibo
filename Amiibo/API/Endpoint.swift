//
//  Endpoint.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import Foundation

enum Endpoint {
    
    case amiibo
    
}

extension Endpoint {
    
    var host: String { "www.amiiboapi.com" }
    
    var path: String {
        
        switch self {
            
        case .amiibo:
            return "/api/amiibo/"
            
        }
        
    }
    
}

extension Endpoint {
    
    var url: URL? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        return urlComponents.url
        
    }
    
}
