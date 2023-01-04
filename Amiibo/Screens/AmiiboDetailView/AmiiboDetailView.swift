//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 9/28/21.
//

import SwiftUI

struct AmiiboDetailView: View {
    
    @StateObject private var viewModel = AmiiboDetailViewModel()
    
    let amiibo: Amiibo
    let inPersistence: Bool
        
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
                
                if !inPersistence {
                    
                    AmiiboDividerView(color: .brandPrimary)
                    
                    Button {
                        
                        Task {
                            
                            await viewModel.favorite(amiibo: amiibo)
                            
                        }
                        
                    } label: {
                        
                        AmiiboButtonView(title: Constants.addToFavorites)
                        
                    }
                    
                }
                
            }
            .padding()
            
        }
        .navigationTitle(amiibo.name)
        .background(Color.background)
        .animation(.easeOut, value: viewModel.isShowingError)
        .animation(.easeOut, value: viewModel.isLoading)
        .blur(radius: viewModel.isShowingError ? 7 : 0)
        .overlay {
            
            if viewModel.isLoading {
                
                AmiiboLoadingView()
                
            }
            
        }
        .overlay {

            if viewModel.addedToFavorites {

                AmiiboSuccessView()
                    .onAppear { viewModel.showOverlayAnimation() }

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
            
            AmiiboDetailView(amiibo: MockData.sampleAmiibo, inPersistence: false)
            
        }
    }
}
