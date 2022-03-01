//
//  AmiiboListViewModel.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

final class AmiiboNavigationViewModel: ObservableObject {
    
    @Published var amiibo: [Amiibo] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    let columns: [GridItem] = [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    /// Retrieves amiibo data from api. If successful we set it to our amiibo array.  Otherwise we display an alert on the screen with what went wrong.
    func getAmiibo() {
        
        isLoading = true
        
        NetworkManager.shared.getAmiibo { [self] result in
            
            DispatchQueue.main.async {
                
                isLoading = false
                
                switch result {
                
                case .success(let amiibo):
                    self.amiibo = amiibo
                    
                case .failure(let error):
                    switch error {
                    
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
