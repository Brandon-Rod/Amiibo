//
//  NetworkingEndpointTest.swift
//  AmiiboTests
//
//  Created by Brandon Rodriguez on 12/31/22.
//

import XCTest
@testable import Amiibo

final class NetworkingEndpointTest: XCTestCase {

    func testEndpointRequestIsValid() {
        
        let endpoint = Endpoint.amiibo
        
        XCTAssertEqual(endpoint.host, "www.amiiboapi.com", "The host should be www.amiiboapi.com")
        XCTAssertEqual(endpoint.path, "/api/amiibo/", "The path should be /api/amiibo/")
        XCTAssertEqual(endpoint.url?.absoluteString, "https://www.amiiboapi.com/api/amiibo/", "Doesn't match our endpoint.")
        
    }

}
