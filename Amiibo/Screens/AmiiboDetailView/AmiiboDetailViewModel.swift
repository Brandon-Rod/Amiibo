//
//  AmiiboDetailViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 4/8/22.
//

import Foundation
import SwiftData

final class AmiiboDetailViewModel: ObservableObject {
    
    @Published private(set) var addedToFavorites = false
    @Published private(set) var error: DetailError?
    @Published private(set) var isLoading = false
    @Published private(set) var isAlreadyInFavorites = false
    @Published var isShowingError = false
    
    var showingOverView: Bool { addedToFavorites || isAlreadyInFavorites }
    
    @MainActor
    /// Adds Amiibo to SwiftData.
    /// - Parameters:
    ///   - amiibo: The object added to favorites.
    ///   - context: The container for persisting data.
    ///   - favorites: The array of amiibo being persisted in SwiftData.
    func favorite(amiibo: Amiibo, context: ModelContext, favorites: [FavoriteAmiibo]) async {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
        
            let response = try await NetworkManager.shared.request(.amiibo, type: AmiiboResponse.self)
            self.addToFavorites(amiibo: amiibo, amiiboArray: response.amiibo, context: context, favorites: favorites)
        
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
    ///   - context: The container for persisting data.
    ///   - favorites: The array of amiibo being persisted in SwiftData.
    private func addToFavorites(amiibo: Amiibo, amiiboArray: [Amiibo], context: ModelContext, favorites: [FavoriteAmiibo]) {
        
        if let selectedAmiibo = amiiboArray.first(where: { $0.image == amiibo.image }) {
            
            let favorite = FavoriteAmiibo(name: selectedAmiibo.name, image: selectedAmiibo.image, type: selectedAmiibo.type, character: selectedAmiibo.character, amiiboSeries: selectedAmiibo.amiiboSeries, gameSeries: selectedAmiibo.gameSeries, head: selectedAmiibo.head, tail: selectedAmiibo.type, release: selectedAmiibo.release)
            
            guard !favorites.contains(where: { $0.image == favorite.image }) else {
                
                isAlreadyInFavorites = true
                return
                
            }
            
            context.insert(favorite)
            addedToFavorites = true
            
        }
        
    }
    
    func showSuccesOverlayAnimation() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            self.addedToFavorites = false
            
        }
        
    }
    
    func showErrorOverlayAnimation() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            self.isAlreadyInFavorites = false
            
        }
        
    }
    
}

extension AmiiboDetailViewModel {
    
    enum DetailError: LocalizedError {
        
        case networking(error: LocalizedError)
        
    }
    
}

extension AmiiboDetailViewModel.DetailError {
    
    var failureReason: String? {
        
        switch self {
        case .networking(let error):

            return error.failureReason
            
        }
        
    }
    
    var errorDescription: String? {
        
        switch self {
            
        case .networking(let error):

            return error.errorDescription
            
        }
        
    }
    
}
