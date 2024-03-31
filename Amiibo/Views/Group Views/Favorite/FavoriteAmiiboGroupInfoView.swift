//
//  FavoriteAmiiboGroupInfoView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/28/24.
//

import SwiftUI

struct FavoriteAmiiboGroupInfoView: View {
    
    let amiibo: FavoriteAmiibo
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            AmiiboSingleInfoView(title: Constants.name, info: amiibo.name)
            
            AmiiboDividerView(color: .text)
            
            AmiiboSingleInfoView(title: Constants.gameSeries, info: amiibo.gameSeries)
            
            AmiiboDividerView(color: .text)
            
            AmiiboSingleInfoView(title: Constants.amiiboSeriesGI, info: amiibo.amiiboSeries)
            
            AmiiboDividerView(color: .text)
            
            AmiiboSingleInfoView(title: Constants.type, info: amiibo.type)
                                                    
        }
        .padding()
        .background(Color.brandPrimary)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 3)
        
    }
    
}

#Preview {
    FavoriteAmiiboGroupInfoView(amiibo: FavoriteAmiibo.example)
}
