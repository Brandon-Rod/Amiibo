//
//  FavoriteAmiibo.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/27/24.
//

import Foundation
import SwiftData

@Model
final class FavoriteAmiibo {
    
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
    
    static var example: FavoriteAmiibo {
        
        return FavoriteAmiibo(name: "Test Name ", image: "", type: "Figure", character: "Test Name", amiiboSeries: "Test", gameSeries: "Test", head: "", tail: "", release: Release(au: "1", eu: "2", jp: "3", na: "4"))
        
    }
    
    init(name: String, image: String, type: String, character: String, amiiboSeries: String, gameSeries: String, head: String, tail: String, release: Release) {
        
        self.name = name
        self.image = image
        self.type = type
        self.character = character
        self.amiiboSeries = amiiboSeries
        self.gameSeries = gameSeries
        self.head = head
        self.tail = tail
        self.release = release
        
    }
    
}
