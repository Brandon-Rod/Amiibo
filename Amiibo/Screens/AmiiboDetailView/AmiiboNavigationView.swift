//
//  ContentView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

struct AmiiboNavigationView: View {
    
    @StateObject var viewModel = AmiiboNavigationViewModel()
    
    @State private var searchText = ""
    @State private var listEnabled = true
    
    var filteredAmiibo: [Amiibo] {
        
        if searchText.isEmpty {
            
            return viewModel.amiibo
            
        } else {
            
            return viewModel.amiibo.filter { $0.name.localizedCaseInsensitiveContains(searchText.lowercased()) }
            
        }
        
    }
    
    var listView: some View {
        
        List(filteredAmiibo) { amiibo in

            NavigationLink(destination: AmiiboDetailView(amiibo: amiibo)) {
                
                AmiiboListCell(amiibo: amiibo)
                
            }

        }
        .listStyle(.plain)
        .accentColor(.brandPrimary)
        .navigationTitle("Amiibo")
        .toolbar { switchCellType }
        
    }
    
    var gridView: some View {
        
        ScrollView {
            
            LazyVGrid(columns: viewModel.columns) {
                
                ForEach(filteredAmiibo) { amiibo in
                    
                    NavigationLink(destination: AmiiboDetailView(amiibo: amiibo)) {
                        
                        AmiiboGridCell(amiibo: amiibo)
                        
                    }
                    
                }
                
            }
            .padding()
            
        }
        .accentColor(.brandPrimary)
        .navigationTitle("Amiibo")
        .toolbar { switchCellType }
        
    }
    
    var switchCellType: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarTrailing) {
            
            Button {
                
                withAnimation { listEnabled.toggle() } } label: {
                    
                    Image(systemName: listEnabled ? "rectangle.grid.3x2" : "list.dash")
                        .foregroundColor(Color.brandPrimary)
                    
                }
            
        }
        
    }
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                
                if listEnabled {
                    
                    listView
                    
                } else {
                    
                    gridView
                    
                }

            }
            .onAppear { viewModel.getAmiibo() }
            
            if viewModel.isLoading { LoadingView() }
            
        }
        .accentColor(.brandPrimary)
        .searchable(text: $searchText)
        .alert(item: $viewModel.alertItem) { alertItem in
            
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboNavigationView()
    }
}
