//
//  FavoritesView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/14/22.
//

import SwiftUI

struct FavoritesView: View {
    
    static let tag: String? = Constants.favoritesTag
    
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Group {
                    
                    if viewModel.amiibo.isEmpty {
                        
                        emptyAmiibo
                        
                    } else {
                        
                        listView
                        
                    }
                    
                }
                
            }
            .navigationTitle(Constants.favorites)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .animation(.easeOut, value: viewModel.filteredAmiibo)
            .onAppear { viewModel.retrieveFavorites() }
            .overlay {
                
                if viewModel.isShowingError {
                                    
                    AmiiboErrorView(isShowingError: $viewModel.isShowingError, title: viewModel.error?.failureReason, message: viewModel.error?.errorDescription)
                    
                }
                
            }
            
        }
        
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

extension FavoritesView {
    
    var emptyAmiibo: some View {
        
        EmptyAmiiboView()
            .padding()
        
    }
    
    var listView: some View {
        
        List {
            
            ForEach(viewModel.filteredAmiibo, id: \.self) { amiibo in
                
                NavigationLink { AmiiboDetailView(amiibo: amiibo, inPersistence: true) } label: {
                    
                    AmiiboListView(amiibo: amiibo)
                    
                }
                
            }
            .onDelete { offsets in
                
                viewModel.delete(offsets)
                
            }
            
        }
        
    }
    
}
