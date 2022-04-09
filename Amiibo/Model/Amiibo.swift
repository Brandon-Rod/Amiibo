//
//  Amiibo.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import Foundation

struct Amiibo: Codable, Hashable, Identifiable {
    
    let name: String
    let image: String
    let type: String
    let character: String
    let amiiboSeries: String
    let gameSeries: String
    let head: String
    let tail: String
    let release: Release
    
    var id: String {
        
        return head + tail
        
    }
    
}

struct Release: Codable, Hashable {
    
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
    
}

struct AmiiboResponse: Codable, Hashable {
    
    let amiibo: [Amiibo]
    
}

struct MockData {
    
    static let sampleAmiibo = Amiibo(name: "Test Name ", image: "", type: "Figure", character: "Test Name", amiiboSeries: "Test", gameSeries: "Test", head: "", tail: "", release: Release(au: "1", eu: "2", jp: "3", na: "4"))
    
    static let amiibo = [sampleAmiibo, sampleAmiibo, sampleAmiibo, sampleAmiibo]
    
}
