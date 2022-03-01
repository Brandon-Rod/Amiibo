//
//  AmiiboListCell.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

struct AmiiboListCell: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        HStack(spacing: 5) {
            
//            I'm not using AsyncImage because there are a lot of amiibo and I need to cache each image
            AmiiboRemoteImage(urlString: amiibo.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(8)
                                
            VStack(alignment: .leading, spacing: 5) {
                
                HStack {
                    
                    Text(amiibo.name)
                        .foregroundColor(.brandPrimary)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Text(amiibo.type)
                        .font(.body)
                        .padding(5)
                        .background(Color.brandPrimary)
                        .cornerRadius(10)
                    
                }
                
                Text(amiibo.amiiboSeries + " Amiibo Series")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
            .padding(.leading)
            
        }
        
    }
    
}

struct AmiiboListCell_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboListCell(amiibo: MockData.sampleAmiibo)
    }
}
