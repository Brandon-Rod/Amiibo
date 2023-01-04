//
//  Amiibo.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import Foundation

struct Amiibo: Codable, Hashable, Identifiable, Equatable {
    
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

struct Release: Codable, Hashable, Equatable {
    
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
    
}

struct AmiiboResponse: Codable, Hashable, Equatable {
    
    let amiibo: [Amiibo]
    
}
