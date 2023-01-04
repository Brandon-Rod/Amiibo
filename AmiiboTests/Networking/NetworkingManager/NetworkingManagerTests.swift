//
//  NetworkingManagerTests.swift
//  AmiiboTests
//
//  Created by Brandon Rodriguez on 1/3/23.
//

import XCTest
@testable import Amiibo

final class NetworkingManagerTests: XCTestCase {

    private var session: URLSession!
    private var url: URL!
    
    override  func setUp() {
        
        url = URL(string: "https://www.amiiboapi.com/api/amiibo/")
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSessionProtocol.self]
        session = URLSession(configuration: configuration)
        
    }
    
    override  func tearDown() {
        
        session = nil
        url =  nil
        
    }

    func testWithSuccessfulResponseIsValid() async throws {
        
        guard let path = Bundle.main.path(forResource: "AmiiboStaticData", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            
            XCTFail("Failed to get the static users file")
            return
            
        }
        
        MockURLSessionProtocol.loadingHandler = {
            
            let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)
            return (response!, data)
            
        }
        
        let result = try await NetworkManager.shared.request(session: session, .amiibo, type: AmiiboResponse.self)
        let staticJSON = try StaticJSONMapper.decode(file: "AmiiboStaticData", type: AmiiboResponse.self)
        
        XCTAssertEqual(result, staticJSON)
        
    }
    
    func testWithUnsuccessfulResponseCodeInInvalidRangeIsInvalid() async {
        
        guard let path = Bundle.main.path(forResource: "AmiiboStaticData", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            
            XCTFail("Failed to get the static users file")
            return
            
        }
        
        MockURLSessionProtocol.loadingHandler = {
            
            let response = HTTPURLResponse(url: self.url, statusCode: 400, httpVersion: nil, headerFields: nil)
            return (response!, data)
            
        }
        
        do {
            
            _ = try await NetworkManager.shared.request(session: session, .amiibo, type: Amiibo.self)
            
        } catch {
                        
            guard let networkError = error as? NetworkManager.AmiiboError else {
                
                XCTFail("Got the wrong type of error.")
                return
                
            }
            
            XCTAssertEqual(networkError, NetworkManager.AmiiboError.invalidResponse, "The error should be invalid response.")
            
        }
        
    }
    
    func testWithSuccessfulResponseWithInvalidJsonIsValid() async {
        
        guard let path = Bundle.main.path(forResource: "AmiiboStaticData", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            
            XCTFail("Failed to get the static users file")
            return
            
        }
        
        MockURLSessionProtocol.loadingHandler = {
            
            let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)
            return (response!, data)
            
        }
        
        do {
            
            _ = try await NetworkManager.shared.request(session: session, .amiibo, type: Amiibo.self)
            
        } catch {
            
            if error is NetworkManager.AmiiboError {
                
                XCTFail("The error should be a system decoding error")
                
            }
            
        }
        
    }

}
