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

extension [Amiibo] {
    
    func sort(on option: SortAmiiboOptionManager) -> [Amiibo] {
        
        switch option {
            
        case .alphabetical:
            self.sorted(by: { $0.name < $1.name })
                        
        case .figure:
            self.sorted(by: { $0.type.contains("Figure") && !$1.type.contains("") })
            
        case .card:
            self.sorted(by: { $0.type.contains("Card") && !$1.type.contains("") })
            
        case .yarn:
            self.sorted(by: { $0.type.contains("Yarn") && !$1.type.contains("") })
            
        
        }
        
    }
    
}
