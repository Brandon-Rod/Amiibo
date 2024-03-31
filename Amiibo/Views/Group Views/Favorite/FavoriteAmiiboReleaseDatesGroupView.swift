//
//  FavoriteAmiiboReleaseDateGroupView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/28/24.
//

import SwiftUI

struct FavoriteAmiiboReleaseDatesGroupView: View {
    
    let amiibo: FavoriteAmiibo
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            AmiiboSingleInfoView(title: Constants.australiaDP, info: amiibo.release.auText)
          
            AmiiboDividerView(color: .text)
            
            AmiiboSingleInfoView(title: Constants.europeDP, info: amiibo.release.euText)
            
            AmiiboDividerView(color: .text)
            
            AmiiboSingleInfoView(title: Constants.japanDP, info: amiibo.release.jpText)
            
            AmiiboDividerView(color: .text)
            
            AmiiboSingleInfoView(title: Constants.northAmericaDP, info: amiibo.release.naText)
                                                    
        }
        .padding()
        .background(Color.brandPrimary)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 3)
        
    }
    
}

#Preview {
    FavoriteAmiiboReleaseDatesGroupView(amiibo: FavoriteAmiibo.example)
}
