//
//  AmiiboReleaseDatesGroupView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboReleaseDatesGroupView: View {
    
    let amiibo: Amiibo
    
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

struct AmiiboReleaseDatesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboReleaseDatesGroupView(amiibo: MockData.sampleAmiibo)
    }
}
