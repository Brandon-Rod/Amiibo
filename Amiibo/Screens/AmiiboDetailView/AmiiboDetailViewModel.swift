//
//  AmiiboDetailViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 4/8/22.
//

import Foundation

final class AmiiboDetailHomeViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    @Published var amiiboAddedToFavorites = false
    @Published var isShowingAlert = false
    @Published var isLoading = false
    
    
    /// Adds Amiibo to UserDefaults
    /// - Parameter amiibo: The Amiibo being added to UserDefaults
    func favorite(amiibo: Amiibo) {
        
        isLoading = true
        
        DispatchQueue.main.async {
            
            NetworkManager.shared.getAmiibo { [weak self] result in
                
                guard let self  = self else { return }
                
                DispatchQueue.main.async { self.isLoading = false }
                
                switch result {
                    
                case .success(let amiiboArray):
                    self.addToFavorites(amiibo: amiibo, amiiboArray: amiiboArray)
                    
                case .failure(let error):
                    self.retrieveAmiiboError(error: error)
                    
                }
                
            }
            
        }
        
    }
    
    /// Adds selected amiibo to favorites
    /// - Parameters:
    ///   - amiibo: The amiibo being added to favorites
    ///   - amiiboArray: The collection we are referencing in order to obtain specific amiibo
    func addToFavorites(amiibo: Amiibo, amiiboArray: [Amiibo]) {
        
        if let selectedAmiibo = amiiboArray.first(where: { $0.image == amiibo.image }) {
            
            let favorite = Amiibo(name: selectedAmiibo.name, image: selectedAmiibo.image, type: selectedAmiibo.type, character: selectedAmiibo.character, amiiboSeries: selectedAmiibo.amiiboSeries, gameSeries: selectedAmiibo.gameSeries, head: selectedAmiibo.head, tail: selectedAmiibo.type, release: selectedAmiibo.release)
            
            PersistenceManager.updateWith(favorite: favorite, actionType: .add) { error in
                
                guard let error = error else {
                    
                    DispatchQueue.main.async { self.amiiboAddedToFavorites = true }
                    return
                    
                }
                
                self.retrieveAmiiboError(error: error)
                
            }
            
        }
        
    }
    
    /// Returns an error if we failed to retrieve amiibo from UserDefaults.
    /// - Parameter error: The error being returned
    func retrieveAmiiboError(error: AmiiboError) {
        
        DispatchQueue.main.async {
            
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
    
}
