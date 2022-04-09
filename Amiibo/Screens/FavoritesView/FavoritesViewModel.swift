//
//  FavoritesViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/22/22.
//

import SwiftUI

final class FavoritesViewModel: ObservableObject {
    
    @Published var amiibo: [Amiibo] = []
    @Published var searchText = ""
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    
    var filteredAmiibo: [Amiibo] {
        
        if searchText.isEmpty {
            
            return amiibo
            
        } else {
            
            return amiibo.filter { $0.name.localizedCaseInsensitiveContains(searchText.lowercased()) }
            
        }
        
    }
    
    /// Retrieves amiibo from UserDefaults
    func retrieveFavorites() {
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let favorites):
                self.amiibo = favorites
                
            case .failure(let error):
                self.retrieveAmiiboError(error: error)
                
            }
            
        }
        
    }
    
    /// Removes amiibo from UserDefaults at its index
    /// - Parameter offsets: The offset of the amiibo being removed from UserDefaults
    func delete(_ offsets: IndexSet) {
        
        let favorites = amiibo
                        
        for offset in offsets {
            
            let favorite = favorites[offset]
            
            PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
                
                guard let self = self else { return }
                
                guard let error = error else {
                    
                    self.amiibo.remove(at: offset)
                    return
                    
                }
                
                self.retrieveAmiiboError(error: error)
                
            }
            
        }
                
    }
    
    /// Returns an error if we failed to retrieve amiibo from UserDefaults.
    /// - Parameter error: The error being returned
    func retrieveAmiiboError(error: AmiiboError) {
        
        switch error {
            
        case .invalidURL:
            self.alertItem = AlertContext.invalidURL
            
        case .invalidResponse:
            self.alertItem = AlertContext.invalidResponse
            
        case .invalidData:
            self.alertItem = AlertContext.invalidData
            
        case .unableToComplete:
            self.alertItem = AlertContext.unableToComplete
            
        case .unableToFavorite:
            self.alertItem = AlertContext.unableToFavorite
            
        case .alreadyInFavorites:
            self.alertItem = AlertContext.alreadyInFavorites
            
        case .invalidUsername:
            self.alertItem = AlertContext.invalidUsername
            
        }
        
    }
    
}

