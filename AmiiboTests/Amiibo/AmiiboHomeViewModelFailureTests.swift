//
//  AmiiboHomeViewModelFailureTests.swift
//  AmiiboTests
//
//  Created by Brandon Rodriguez on 1/3/23.
//

import XCTest
@testable import Amiibo

final class AmiiboHomeViewModelFailureTests: XCTestCase {

    private var networkManager: NetworkManagerProtocol!
    private var vM: AmiiboHomeViewModel!
    
    override func setUp() {
        
        networkManager = AmiiboHomeViewModelFailureMock()
        vM = AmiiboHomeViewModel(networkManager: networkManager)
        
    }
    
    override func tearDown() {
        
        networkManager = nil
        vM = nil
        
    }
    
    func testWithUnsuccessfulResponseErrorIsHandled() async {
        
        XCTAssertFalse(vM.isLoading, "The vm shouldn't be loading any data")
        
        defer { XCTAssertFalse(vM.isLoading, "The vm shouldn't be loading any data") }
        
        await vM.fetchAmiibo()
        
        XCTAssertTrue(vM.isShowingError, "The view model should have an error")
        XCTAssertNotNil(vM.error, "The view model error should be set")
        
    }

}
