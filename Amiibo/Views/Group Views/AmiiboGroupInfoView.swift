//
//  AmiiboGroupInfoView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboGroupInfoView: View {
    
    let amiibo: Amiibo
    
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

struct AmiiboGroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboGroupInfoView(amiibo: MockData.sampleAmiibo)
    }
}
