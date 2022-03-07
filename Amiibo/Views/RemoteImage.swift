//
//  RemoteImage.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
//    If completed, we will receive our image from api, else we fail
    func load(fromURLString urlString: String) {
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            
            guard let uiImage = uiImage else { return }
            
            DispatchQueue.main.async { self.image = Image(uiImage: uiImage) }
            
        }
        
    }
    
}

//If view is nil, we use a placeholder, otherwise we uses the image from api
struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        
        image?.resizable() ?? Image("amiibo-Placeholder").resizable()
        
    }
    
}

//Gives the us the amiiboImage
struct AmiiboRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View {
        
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
        
    }
    
}
