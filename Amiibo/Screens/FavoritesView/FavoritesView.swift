//
//  FavoritesView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/14/22.
//

import SwiftUI

struct FavoritesView: View {
    
    static let tag: String? = Strings.favoritesTag
    
    @StateObject var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Group {
                    
                    if favoritesViewModel.amiibo.isEmpty {
                        
                        EmptyAmiiboView()
                        
                    } else {
                        
                        List {
                            
                            ForEach(favoritesViewModel.filteredAmiibo, id: \.self) { amiibo in
                                
                                NavigationLink(destination: AmiiboDetailView(inPersistence: .constant(true), amiibo: amiibo)) {
                                    
                                    AmiiboListCell(amiibo: amiibo)
                                    
                                }
                                
                            }
                            .onDelete { offsets in
                                
                                favoritesViewModel.delete(offsets)
                                
                            }
                            
                        }
                        .blur(radius: favoritesViewModel.isShowingAlert ? 5 : 0)
                        .disabled(favoritesViewModel.isShowingAlert)
                        
                    }
                    
                }

            }
            .navigationTitle(Strings.favorites)
            .listStyle(.plain)
            .animation(.easeInOut, value: favoritesViewModel.searchText)
            .animation(.easeInOut, value: favoritesViewModel.isShowingAlert)
            .searchable(text: $favoritesViewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .alert(item: $favoritesViewModel.alertItem) { item in
                
                Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
                
            }
            .onAppear { favoritesViewModel.retrieveFavorites() }
            
        }
        
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
