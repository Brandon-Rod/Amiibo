//
//  AmiiboHomeViewModelSuccessTests.swift
//  AmiiboTests
//
//  Created by Brandon Rodriguez on 1/3/23.
//

import XCTest
@testable import Amiibo

final class AmiiboHomeViewModelSuccessTests: XCTestCase {
    
    private var networkManager: NetworkManagerProtocol!
    private var vM: AmiiboHomeViewModel!
    
    override func setUp() {
        
        networkManager = NetworkManagerUserResponseSuccessMock()
        vM = AmiiboHomeViewModel(networkManager: networkManager)
        
    }
    
    override func tearDown() {
        
        networkManager = nil
        vM = nil
        
    }

    func testWithSuccessfulResponseUsersArrayIsSet() async throws {
        
        XCTAssertFalse(vM.isLoading, "The vm shouldn't be loading any data")
        
        defer { XCTAssertFalse(vM.isLoading, "The vm shouldn't be loading any data") }
        
        await vM.fetchAmiibo()
        XCTAssertEqual(vM.amiibo.count, 9, "There  should be 6 users within our data array")
        
    }
    
    func testAmiiboOnceDoesNotRunAfterAppearing() async throws {
                
        XCTAssertFalse(vM.isLoading, "The vm shouldn't be loading any data")
        
        defer { XCTAssertFalse(vM.isLoading, "The vm shouldn't be loading any data") }
        
        await vM.fetchAmiiboOnce()
        XCTAssertEqual(vM.amiibo.count, 9, "There should be 9 users within our data array")
        
        await vM.fetchAmiiboOnce()
        XCTAssertEqual(vM.amiibo.count, 9, "There should be 9 users within our data array")
        
    }

}
