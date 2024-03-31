//
//  FavoritesDetailView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/28/24.
//

import SwiftUI

struct FavoritesDetailView: View {
    
    let amiibo: FavoriteAmiibo
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center, spacing: 10) {
                
                AsyncImage(url: .init(string: amiibo.image)) { image in
                    
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)

                } placeholder: { PlaceholderView() }
                
                AmiiboDividerView(color: .brandPrimary)
                
                
                FavoriteAmiiboGroupInfoView(amiibo: amiibo)
                
                FavoriteAmiiboReleaseDatesGroupView(amiibo: amiibo)
                
                
            }
            .padding()
            
        }
        .navigationTitle(amiibo.name)
        .background(Color.background)
        
    }
    
}

#Preview {
    FavoritesDetailView(amiibo: FavoriteAmiibo.example)
}
