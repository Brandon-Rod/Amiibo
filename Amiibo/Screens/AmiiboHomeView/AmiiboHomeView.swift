//
//  ContentView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

struct AmiiboHomeView: View {
    
    static let tag: String? = Constants.homeTag
    
    @StateObject private var viewModel = AmiiboHomeViewModel()
        
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                if viewModel.isLoading {
                    
                    AmiiboLoadingView()
                    
                } else {
                    
                    if viewModel.listEnabled {
                        
                        listView
                        
                    } else {
                        
                        gridBackground
                        
                        gridView
                        
                    }
                    
                }
                
            }
            .navigationTitle("Amiibo")
            .toolbar { switchCellType }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .refreshable {
                
                Task { await viewModel.fetchAmiibo() }
                
            }
            .animation(.easeInOut, value: viewModel.filteredAmiibo)
            .animation(.easeInOut, value: viewModel.isLoading)
            .task { await viewModel.fetchAmiiboOnce() }
            .overlay {
                
                if viewModel.isShowingError {
                    
                    AmiiboErrorView(isShowingError: $viewModel.isShowingError, title: viewModel.error?.failureReason, message: viewModel.error?.errorDescription)
                    
                }
                
            }
            
        }
        
    }
    
}

struct AmiiboHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboHomeView()
    }
}

private extension AmiiboHomeView {
    
    var listView: some View {
        
        List(viewModel.filteredAmiibo) { amiibo in
            
            NavigationLink(destination: AmiiboDetailView(amiibo: amiibo, inPersistence: false)) {
                
                AmiiboListView(amiibo: amiibo)
                
            }
            
        }
        
        
    }
    
    var gridView: some View {
        
        ScrollView {
            
            LazyVGrid(columns: columns, spacing: 10) {
                
                ForEach(viewModel.filteredAmiibo, id: \.id) { amiibo in
                    
                    NavigationLink(destination: AmiiboDetailView(amiibo: amiibo, inPersistence: false)) {
                        
                        AmiiboGridView(amiibo: amiibo)
                        
                    }
                    
                }
                .padding(.horizontal)
                
            }
            
        }
        
    }
    
    var gridBackground: some View {
        
        Color.background
            .ignoresSafeArea(edges: .top)
        
    }
    
    var switchCellType: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarTrailing) {
            
            Button {
                
                withAnimation { viewModel.listEnabled.toggle() } } label: {
                    
                    Image(systemName: viewModel.listEnabled ? SFSymbols.grid : SFSymbols.list)
                        .foregroundColor(Color.brandPrimary)
                    
                }
                .disabled(viewModel.isLoading)
            
        }
        
    }
    
}
