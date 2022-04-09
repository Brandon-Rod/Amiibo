//
//  ContentView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

struct AmiiboHomeView: View {
    
    @StateObject var homeViewModel = AmiiboHomeViewModel()
    
    static let tag: String? = Strings.homeTag
    
    var listView: some View {
        
        List(homeViewModel.filteredAmiibo) { amiibo in

            NavigationLink(destination: AmiiboDetailView(inPersistence: .constant(false), amiibo: amiibo)) {
                
                AmiiboListCell(amiibo: amiibo)
                
            }

        }
        .listStyle(.plain)
        .accentColor(.brandPrimary)
        .navigationTitle(Strings.homeTitle)
        .refreshable { homeViewModel.getAmiibo() }
        .toolbar { switchCellType }
        .overlay { if homeViewModel.isLoading { LoadingView() } }

    }
    
    var gridView: some View {
        
        ScrollView {
            
            LazyVGrid(columns: homeViewModel.columns) {
                
                ForEach(homeViewModel.filteredAmiibo) { amiibo in
                    
                    NavigationLink(destination: AmiiboDetailView(inPersistence: .constant(false), amiibo: amiibo)) {
                        
                        AmiiboGridCell(amiibo: amiibo)
                        
                    }
                    
                }
                
            }
            .padding()
            .overlay { if homeViewModel.isLoading { LoadingView() } }
            
        }
        .accentColor(.brandPrimary)
        .navigationTitle(Strings.homeTitle)
        .toolbar {
            
            refresh
            switchCellType
            
        }
        .overlay { if homeViewModel.isLoading { LoadingView() } }
        
    }
    
    var refresh: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            
            Button {
                
                withAnimation { homeViewModel.getAmiibo() } } label: {
                    
                    Image(systemName: SFSymbols.refresh)
                        .foregroundColor(Color.brandPrimary)
                    
                }
            
        }
        
    }
    
    var switchCellType: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarTrailing) {
            
            Button {
                
                withAnimation { homeViewModel.listEnabled.toggle() } } label: {
                    
                    Image(systemName: homeViewModel.listEnabled ? SFSymbols.grid : SFSymbols.list)
                        .foregroundColor(Color.brandPrimary)
                    
                }
            
        }
        
    }
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                                
                if homeViewModel.listEnabled {
                    
                    listView
                    
                } else {
                    
                    gridView
                    
                }
                
            }
            .animation(.easeInOut, value: homeViewModel.searchText)
            .animation(.easeInOut, value: homeViewModel.listEnabled)
            .onAppear { homeViewModel.getAmiiboOnAppear() }
            
        }
        .accentColor(.brandPrimary)
        .searchable(text: $homeViewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .alert(item: $homeViewModel.alertItem) { alertItem in
            
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboHomeView()
    }
}
