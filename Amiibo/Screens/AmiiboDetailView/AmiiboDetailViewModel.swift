//
//  AmiiboDetailViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 4/8/22.
//

import Foundation

final class AmiiboDetailViewModel: ObservableObject {
    
    @Published private(set) var addedToFavorites = false
    @Published private(set) var error: DetailError?
    @Published private(set) var isLoading = false
    @Published var isShowingError = false
    
    @MainActor
    /// Adds amiibo to UserDefaults.
    /// - Parameter amiibo: The object added to favorites.
    func favorite(amiibo: Amiibo) async {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            
            let response = try await NetworkManager.shared.request(.amiibo, type: AmiiboResponse.self)
            self.addToFavorites(amiibo: amiibo, amiiboArray: response.amiibo)
            
        } catch {
            
            self.isShowingError = true
            if let networkingError = error as? NetworkManager.AmiiboError {
                
                self.error = .networking(error: networkingError)
                
            }
            
        }
        
    }
    
    /// Checks whether amiibo is able to be added to favorites
    /// - Parameters:
    ///   - amiibo: The object that'll be added to favorites.
    ///   - amiiboArray: The array of amiibo from the API.
    func addToFavorites(amiibo: Amiibo, amiiboArray: [Amiibo]) {
        
        if let selectedAmiibo = amiiboArray.first(where: { $0.image == amiibo.image }) {
            
            let favorite = Amiibo(name: selectedAmiibo.name, image: selectedAmiibo.image, type: selectedAmiibo.type, character: selectedAmiibo.character, amiiboSeries: selectedAmiibo.amiiboSeries, gameSeries: selectedAmiibo.gameSeries, head: selectedAmiibo.head, tail: selectedAmiibo.type, release: selectedAmiibo.release)
            
            PersistenceManager.updateWith(favorite: favorite, actionType: .add) { error in
                
                guard let error = error else {
                    
                    DispatchQueue.main.async { self.addedToFavorites = true }
                    return
                    
                }
                
                DispatchQueue.main.async {
                    
                    self.isShowingError = true
                    self.error = .persistence(error: error)
                    
                }
                
            }
            
        }
        
    }
    
    func showOverlayAnimation() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            self.addedToFavorites = false
            
        }
        
    }
    
}

extension AmiiboDetailViewModel {
    
    enum DetailError: LocalizedError {
        
        case networking(error: LocalizedError)
        case persistence(error: LocalizedError)
        
    }
    
}

extension AmiiboDetailViewModel.DetailError {
    
    var failureReason: String? {
        
        switch self {
        case .networking(let error),
                .persistence(let error):
            return error.failureReason
        }
        
    }
    
    var errorDescription: String? {
        
        switch self {
            
        case .networking(let error),
                .persistence(let error):
            return error.errorDescription
            
        }
        
    }
    
}
