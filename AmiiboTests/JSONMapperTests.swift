//
//  JSONMapperTests.swift
//  AmiiboTests
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import Foundation
import XCTest
@testable import Amiibo

class JSONMapperTests: XCTestCase {
    
    func testWithValidJSONSuccessfullyDecodes() {
        
        XCTAssertNoThrow(try StaticJSONMapper.decode(file: "AmiiboStaticData", type: AmiiboResponse.self), "Mapper shouldn't throw an error")
        
        let userResponse = try? StaticJSONMapper.decode(file: "AmiiboStaticData", type: AmiiboResponse.self)
        XCTAssertNotNil(userResponse, "User response shouldn't be nil.")
        
        XCTAssertEqual(userResponse?.amiibo.count, 9, "The total number should be 9.")
        
        XCTAssertEqual(userResponse?.amiibo[0].amiiboSeries, "Super Smash Bros.", "The amiibo series should be Super Smash Bros.")
        XCTAssertEqual(userResponse?.amiibo[0].character, "Mario", "The character should be Mario.")
        XCTAssertEqual(userResponse?.amiibo[0].gameSeries, "Super Mario", "The game series should be Super Mario.")
        XCTAssertEqual(userResponse?.amiibo[0].head, "00000000", "The head should be 00000000")
        XCTAssertEqual(userResponse?.amiibo[0].image, "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png", "The url should be https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png")
        XCTAssertEqual(userResponse?.amiibo[0].name, "Mario", "The name should be Mario.")
        XCTAssertEqual(userResponse?.amiibo[0].release, Release(au: "2014-11-29", eu: "2014-11-28", jp: "2014-12-06", na: "2014-11-21"), "The release should be au 2014-11-29, eu 2014-11-28, jp 2014-12-06, na 2014-11-21")
        XCTAssertEqual(userResponse?.amiibo[0].tail, "00000002", "The tail should be 00000002.")
        XCTAssertEqual(userResponse?.amiibo[0].type, "Figure", "The type should be Figure.")
        
    }
    
    func testWithMissingFileErrorThrown() {
        
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "", type: AmiiboResponse.self), "An error should be thrown.")
        
        do {
            
            _  = try StaticJSONMapper.decode(file: "", type: AmiiboResponse.self)
            
        } catch {
            
            
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                
             XCTFail("This is the wrong mapping error")
                return
                
            }
            
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
            
        }
        
    }
    
    func testWithInvalidFileErrorThrown() {
        
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "as", type: AmiiboResponse.self), "An error should be thrown.")
        
        do {
            
            _  = try StaticJSONMapper.decode(file: "as", type: AmiiboResponse.self)
            
        } catch {
            
            
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                
             XCTFail("This is the wrong mapping error")
                return
                
            }
            
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
            
        }
        
    }
    
    func testWithInvalidJSONErrorThrown() {
        
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "AmiiboStaticData", type: Amiibo.self), "An error should be thrown.")
        
        do {
            
            _ = try StaticJSONMapper.decode(file: "AmiiboStaticData", type: Amiibo.self)
            
        } catch {
            
            if error is StaticJSONMapper.MappingError {
                
                XCTFail("Got the wrong type of error, expecting a system decoding error")
                
            }
            
        }
        
    }
    
}
