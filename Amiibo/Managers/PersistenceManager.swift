//
//  PersistenceManager.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/14/22.
//

import Foundation

enum PersistenceActionType {
    
    case add, remove
    
}

/// An environment singleton responsible for retrieving amiibo, updating amiibo, and saving amiibo from User Defaults.
enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
     
    enum Keys {
        
        static let favorites = "favorites"
        
    }
    
    /// Updates Amiibo in User Defaults
    /// - Parameters:
    ///   - favorite: Amiibo being updated
    ///   - actionType: Whether we are adding or removing Amiibo to User Defaults.
    ///   - completed: Result acquired from function.
    static func updateWith(favorite: Amiibo, actionType: PersistenceActionType, completed: @escaping (AmiiboError?) -> Void) {
        
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
    
    /// Retrieves favorited Amiibo from User Defaults
    /// - Parameter completed: Result acquired from function.
    static func retrieveFavorites(completed: @escaping (Result<[Amiibo], AmiiboError>) -> Void) {
        
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
    
    /// Saves Amiibo to User Defaults
    /// - Parameter favorites: The [Amiibo] being saved.
    /// - Returns: Result acquired from function.
    static func save(favorites: [Amiibo]) -> AmiiboError? {
        
        do {
            
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            
            return nil
            
        } catch { return .unableToFavorite }
                
    }
    
}
