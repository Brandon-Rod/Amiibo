//
//  CachedImageManager.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import Foundation

final class CachedImageManager: ObservableObject {
    
    @Published private(set) var currentState: CurrentState?
    
    private let imageRetriever = ImageRetriever()
    
    @MainActor
    func load(_ url: String, cache: ImageCache = .shared) async {
        
        self.currentState = .loading
        
        if let imageData = cache.object(forKey: url as NSString) {
            
            self.currentState = .success(data: imageData)
            return
            
        }
        
        do {
            
            let data = try await imageRetriever.fetchImage(url)
            
            self.currentState = .success(data: data)
            
            cache.set(object: data as NSData, forKey: url as NSString)
            
        } catch {
            
            self.currentState = .failed
            
        }
        
    }
    
}

extension CachedImageManager {
    
    enum CurrentState {
        
        case loading
        case failed
        case success(data: Data)
        
    }
    
}
