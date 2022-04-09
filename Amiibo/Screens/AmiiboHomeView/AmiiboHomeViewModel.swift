//
//  AmiiboListViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

final class AmiiboHomeViewModel: ObservableObject {
    
    @Published var amiibo: [Amiibo] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var searchText = ""
    @Published var listEnabled = true
    @Published var alreadyAppeared = false
    
    let columns: [GridItem] = [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var filteredAmiibo: [Amiibo] {
        
        if searchText.isEmpty {
            
            return amiibo
            
        } else {
            
            return amiibo.filter { $0.name.localizedCaseInsensitiveContains(searchText.lowercased()) }
            
        }
        
    }
    
    /// Retrieves amiibo from api only when screen appears for the first time
    func getAmiiboOnAppear() {
        
        if !alreadyAppeared {
            
            getAmiibo()
            alreadyAppeared = true
            
        }
        
    }
    
    /// Retrieves amiibo data from api. If successful we set it to our amiibo array.  Otherwise we display an alert on the screen with what went wrong.
    func getAmiibo() {
        
        self.isLoading = true
        
        NetworkManager.shared.getAmiibo { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                case .success(let amiibo):
                    self.amiibo = amiibo
                    
                case .failure(let error):
                    self.retrieveAmiiboError(error: error)
                    
                }
                
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
