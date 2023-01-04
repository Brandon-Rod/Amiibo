//
//  MockData.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import Foundation

struct MockData {
    
    static let sampleAmiibo = Amiibo(name: "Test Name ", image: "", type: "Figure", character: "Test Name", amiiboSeries: "Test", gameSeries: "Test", head: "", tail: "", release: Release(au: "1", eu: "2", jp: "3", na: "4"))
    
    static let amiibo = [sampleAmiibo, sampleAmiibo, sampleAmiibo, sampleAmiibo]
    
}
