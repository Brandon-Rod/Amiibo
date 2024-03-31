//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 9/28/21.
//

import SwiftUI
import SwiftData

struct AmiiboDetailView: View {
    
    @StateObject private var viewModel = AmiiboDetailViewModel()
    
    @Environment(\.modelContext) var context
    
    @Query private var favoriteAmiibo: [FavoriteAmiibo]
    
    let amiibo: Amiibo
        
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
                
                AmiiboGroupInfoView(amiibo: amiibo)
                
                AmiiboReleaseDatesGroupView(amiibo: amiibo)
                
                AmiiboDividerView(color: .brandPrimary)
                
                Button {
                    
                    Task {
                        
                        await viewModel.favorite(amiibo: amiibo, context: context, favorites: favoriteAmiibo)
                        
                    }
                    
                } label: {
                    
                    AmiiboButtonView(title: Constants.addToFavorites)
                    
                }
                
            }
            .padding()
            
        }
        .navigationTitle(amiibo.name)
        .background(Color.background)
        .animation(.easeOut, value: viewModel.isShowingError)
        .animation(.easeOut, value: viewModel.isLoading)
        .animation(.easeOut, value: viewModel.isAlreadyInFavorites)
        .blur(radius: viewModel.isShowingError ? 7 : 0)
        .blur(radius: viewModel.showingOverView ? 7 : 0)
        .disabled(viewModel.showingOverView)
        .overlay {
            
            if viewModel.isLoading {
                
                AmiiboLoadingView()
                
            }
            
        }
        .overlay {

            if viewModel.addedToFavorites {

                AmiiboSuccessView()
                    .onAppear { viewModel.showSuccesOverlayAnimation() }

            }

        }
        .overlay {
            
            if viewModel.isAlreadyInFavorites {
                
                AmiiboAlreadyInFavoritesView()
                    .onAppear { viewModel.showErrorOverlayAnimation() }
                
            }
            
        }
        .overlay {
            
            if viewModel.isShowingError {
                                
                AmiiboErrorView(isShowingError: $viewModel.isShowingError, title: viewModel.error?.failureReason, message: viewModel.error?.errorDescription)
                
            }
            
        }
        
    }
    
}

struct AmiiboDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            AmiiboDetailView(amiibo: MockData.sampleAmiibo)
            
        }
    }
}
