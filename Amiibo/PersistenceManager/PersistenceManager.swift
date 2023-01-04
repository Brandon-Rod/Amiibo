//
//  PersistenceManager.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/14/22.
//

import Foundation

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    static func updateWith(favorite: Amiibo, actionType: PersistenceActionType, completed: @escaping (PersistenceError?) -> Void) {
        
        retrieveFavorites { result in
            
            switch result {
                
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                    
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        
                        completed(.alreadyInFavorites)
                        return
                        
                    }
                    
                    retrievedFavorites.append(favorite)
                                        
                case .remove:
                    retrievedFavorites.removeAll { $0.image == favorite.image }
                    
                }
                
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
                
            }
            
        }
        
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Amiibo], PersistenceError>) -> Void) {
        
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            
            completed(.success([]))
            return
            
        }
        
        do {
            
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Amiibo].self, from: favoritesData)
            completed(.success(favorites))
            
        } catch { completed(.failure(.unableToFavorite)) }
        
    }
    
    static func save(favorites: [Amiibo]) -> PersistenceError? {
        
        do {
            
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            
            return nil
            
        } catch { return .unableToFavorite }
                
    }
    
}

extension PersistenceManager {
    
    enum Keys {
        
        static let favorites = "favorites"
        
    }
    
}

extension PersistenceManager {
    
    enum PersistenceActionType {
        
        case add, remove
        
    }
    
}

extension PersistenceManager {
    
    enum PersistenceError: LocalizedError {
        
        case alreadyInFavorites
        case unableToFavorite
        
    }
    
}


extension PersistenceManager.PersistenceError {
    
    var failureReason: String? {
        
        switch self {
            
        case .alreadyInFavorites:
            return Constants.alreadyInFavoritesReason
            
        case .unableToFavorite:
            return Constants.unableToFavoriteReason
            
        }
        
    }
    
    var errorDescription: String? {
        
        switch self {
            
        case .alreadyInFavorites:
            return Constants.alreadyInFavoritesDescription
            
        case .unableToFavorite:
            return Constants.unableToFavoriteDescription
            
        }
        
    }
    
}
