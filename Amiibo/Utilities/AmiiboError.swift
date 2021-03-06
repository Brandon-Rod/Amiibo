//
//  AMError.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import Foundation

enum AmiiboError: String, Error {
    
    case invalidURL, invalidResponse, invalidData, unableToComplete, unableToFavorite, alreadyInFavorites, invalidUsername
    
}
