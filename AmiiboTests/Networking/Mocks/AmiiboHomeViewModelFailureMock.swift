//
//  AmiiboHomeViewModelFailureMock.swift
//  AmiiboTests
//
//  Created by Brandon Rodriguez on 1/3/23.
//

import Foundation
@testable import Amiibo

class AmiiboHomeViewModelFailureMock: NetworkManagerProtocol {
    
    func request<T>(session: URLSession, _ endpoint: Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        
        throw NetworkManager.AmiiboError.invalidURL
        
    }
    
}
