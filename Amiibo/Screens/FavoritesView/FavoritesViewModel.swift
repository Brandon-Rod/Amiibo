//
//  FavoritesViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/22/22.
//

import SwiftUI

final class FavoritesViewModel: ObservableObject {
    
    @Published private(set) var amiibo: [Amiibo] = []
    @Published private(set) var error: PersistenceManager.PersistenceError?
    @Published var searchText = ""
    @Published var isShowingError = false
    
    var filteredAmiibo: [Amiibo] {
            
            if searchText.isEmpty {
                
                return amiibo
                
            } else {
                
                return amiibo.filter { $0.name.localizedCaseInsensitiveContains(searchText.lowercased()) }
                
            }
            
        }
    
    /// Retrieves amiibo from UserDefaults.
    func retrieveFavorites() {
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let favorites):
                self.amiibo = favorites
                
            case .failure(let error):
                self.isShowingError = true
                self.error = error
                
            }
            
        }
        
    }
    
    /// Removes amiibo from UserDefaults.
    /// - Parameter offsets: The index of the amiibo.
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
                
                DispatchQueue.main.async {
                    
                    self.isShowingError = true
                    self.error = error
                    
                }
                                
            }
            
        }
                
    }
    
}
