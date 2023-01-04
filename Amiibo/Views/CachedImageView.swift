//
//  CachedImage.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct CachedImageView<Content: View>: View {
    
    @StateObject private var manager = CachedImageManager()
    
    let url: String
    
    @ViewBuilder let content: (AsyncImagePhase)-> Content
    
    var body: some View {
        
        ZStack {
            
            switch manager.currentState {
                
            case .loading:
                content(.empty)
                
            case.success(data: let data):
                if let image = UIImage(data: data) {
                    
                    content(.success(Image(uiImage: image)))
                    
                } else {
                    
                    content(.empty)
                    
                }
                
            default:
                content(.empty)
                
            }
            
        }
        .task { await manager.load(url) }
        
    }
    
}

struct CachedImage_Previews: PreviewProvider {
    static var previews: some View {
        CachedImageView(url: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png") { _ in
            
            EmptyView()
            
        }
    }
}
