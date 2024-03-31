//
//  SortAmiiboOptionManager.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/31/24.
//

import Foundation

enum SortAmiiboOptionManager: String, CaseIterable {
    
    case alphabetical
    case figure
    case card
    case yarn
    
    var localizedString: String {
        
        switch self {
            
        case .alphabetical:
            "Alphabetical"
            
        case .figure:
            "Figure"
            
        case .card:
            "Card"
            
        case .yarn:
            "Yarn"
            
        }
        
    }
    
    var systemImage: String {
        
        switch self {
            
        case .alphabetical:
            SFSymbols.alphabetical
            
        case .figure:
            SFSymbols.figure
            
        case .card:
            SFSymbols.card
            
        case .yarn:
            SFSymbols.star
            
        }
        
    }
    
}
