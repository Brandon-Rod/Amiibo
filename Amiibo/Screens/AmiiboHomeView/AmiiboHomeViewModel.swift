//
//  AmiiboListViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import Foundation

final class AmiiboHomeViewModel: ObservableObject {
    
    @Published private(set) var amiibo: [Amiibo] = []
    @Published private(set) var isLoading = false
    @Published private(set) var error: NetworkManager.AmiiboError?
    @Published private(set) var alreadyAppeared = false
    @Published var searchText = ""
    @Published var isShowingError = false
    @Published var listEnabled = true
    @Published var selectedSortOption = SortAmiiboOptionManager.allCases.first!
    
    var filteredAmiibo: [Amiibo] {
            
            if searchText.isEmpty {
                
                return amiibo.sort(on: selectedSortOption)
                
            } else {
                
                let filteredAmiibo = amiibo.compactMap { amiibo in
                    
                    let amiiboName = amiibo.name.range(of: searchText, options: .caseInsensitive) != nil
                    return amiiboName ? amiibo : nil
                    
                }
                
                return filteredAmiibo.sort(on: selectedSortOption)
                
            }
            
        }
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        
        self.networkManager =  networkManager
        
    }
    
    @MainActor
    /// Fetches amiibo from the API if it hasn't already been fetched.
    func fetchAmiiboOnce() async {
        
        if !alreadyAppeared {
            
            isLoading = true
            
            defer { isLoading = false }
            
            await fetchAmiibo()
            
            alreadyAppeared = true
            
        }
        
    }
    
    @MainActor
    /// Fetches Amiibo from the API.
    func fetchAmiibo() async {
        
        isLoading = true
        
        defer { isLoading = false }
        
        do {
            
            let response = try await networkManager.request(session: .shared, .amiibo, type: AmiiboResponse.self)
            self.amiibo = response.amiibo
            
        } catch {
            
            self.isShowingError = true
            if let networkingError = error as? NetworkManager.AmiiboError {
                
                self.error = networkingError
                
            } else {
                
                self.error = .invalidData
                
            }
            
        }
        
    }
    
}
