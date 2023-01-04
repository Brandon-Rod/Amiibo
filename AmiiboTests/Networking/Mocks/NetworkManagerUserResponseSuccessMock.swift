//
//  NetworkManagerUserResponseSuccessMock.swift
//  AmiiboTests
//
//  Created by Brandon Rodriguez on 1/3/23.
//

import XCTest
@testable import Amiibo

final class NetworkManagerUserResponseSuccessMock: NetworkManagerProtocol {
    
    func request<T>(session: URLSession, _ endpoint: Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        
        return try StaticJSONMapper.decode(file: "AmiiboStaticData", type: AmiiboResponse.self) as! T
        
    }
    
}
