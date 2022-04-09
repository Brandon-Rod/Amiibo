//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 9/28/21.
//

import SwiftUI

struct AmiiboDetailView: View {
    
    @Binding var inPersistence: Bool
    
    @StateObject var detailViewModel = AmiiboDetailHomeViewModel()
    
    let amiibo: Amiibo
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                VStack(alignment: .center, spacing: 10) {
                    
                    AmiiboRemoteImage(urlString: amiibo.image)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                    Divider()
                    
                    HStack {
                        
                        AmiiboInfoView(amiibo: amiibo)
                        
                        Spacer()
                        
                    }
                    
                    HStack {
                        
                        AmiiboReleaseDate(amiibo: amiibo)
                        
                        Spacer()
                        
                    }
                                        
                    if !inPersistence {
                        
                        Divider()
                        
                        Button {
                            
                            detailViewModel.favorite(amiibo: amiibo) } label: { AmiiboButton(title: Strings.addToFavorites)
                                
                            }
                        
                    }
                    
                }
                .padding()
                
            }
            .navigationTitle(amiibo.name)
            .blur(radius: detailViewModel.isShowingAlert ? 5 : 0)
            .disabled(detailViewModel.isShowingAlert)
            .overlay { if detailViewModel.isLoading { LoadingView() } }
            
            if detailViewModel.amiiboAddedToFavorites {
                
                AmiiboAlertView(isShowingAlert: $detailViewModel.amiiboAddedToFavorites, title: Strings.success, message: Strings.addedToFavorites)
                
            }
            
        }
        .animation(.easeInOut, value: detailViewModel.isShowingAlert)
        .animation(.easeInOut, value: detailViewModel.isLoading)
        .alert(item: $detailViewModel.alertItem) { item in
            
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
            
        }
        
    }
    
}

struct AmiiboDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetailView(inPersistence: .constant(false), amiibo: MockData.sampleAmiibo)
    }
}
