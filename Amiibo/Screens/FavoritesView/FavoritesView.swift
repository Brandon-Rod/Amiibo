//
//  FavoritesView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/14/22.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    static let tag: String? = Constants.favoritesTag
        
    @Environment(\.modelContext) var context
    
    @Query(sort: \FavoriteAmiibo.name) var favoriteAmiibo: [FavoriteAmiibo]
    
    @State private var searchText = ""
    @State private var isShowingError = false
    
    private var filteredAmiibo: [FavoriteAmiibo] {
        
        if searchText.isEmpty {
            
            return favoriteAmiibo
            
        } else {
            
            return favoriteAmiibo.filter { $0.name.localizedCaseInsensitiveContains(searchText.lowercased()) }
            
        }
        
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Group {
                    
                    if favoriteAmiibo.isEmpty {
                        
                        emptyAmiibo
                        
                    } else {
                        
                        listView
                        
                    }
                    
                }
                
            }
            .navigationTitle(Constants.favorites)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search favorites")
            .animation(.easeOut, value: filteredAmiibo)
            
        }
        
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

extension FavoritesView {
    
    private var emptyAmiibo: some View {
        
        EmptyAmiiboView()
            .padding()
        
    }
    
    private var listView: some View {
        
        List {
            
            ForEach(filteredAmiibo) { amiibo in
            
                NavigationLink { FavoritesDetailView(amiibo: amiibo) } label: {
            
                    FavoriteAmiiboView(amiibo: amiibo)
            
                }
            
            }
            .onDelete { indexSet in
            
                for index in indexSet {
                    
                    context.delete(favoriteAmiibo[index])
                    
                }
                
            }
            
            
        }
        
    }
    
}
