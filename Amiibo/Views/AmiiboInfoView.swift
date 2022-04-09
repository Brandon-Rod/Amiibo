//
//  AmiiboInfoView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 4/8/22.
//

import SwiftUI

struct AmiiboInfoView: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            AmiiboTitleView(text: Strings.info)
            
            Text(Strings.name) + Text(amiibo.name).foregroundColor(.brandPrimary)
            
            Text(Strings.gamesSeries) + Text(amiibo.gameSeries).foregroundColor(.brandPrimary)
            
            Text(Strings.infoAmiiboSeries) + Text(amiibo.amiiboSeries).foregroundColor(.brandPrimary)
            
            Text(Strings.type) + Text(amiibo.type).foregroundColor(.brandPrimary)
            
        }
        
    }
    
}
