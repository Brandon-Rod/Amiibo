//
//  AmiiboGridCell.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 9/26/21.
//

import SwiftUI

struct AmiiboGridCell: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        VStack(spacing: 5) {
            
//            I'm not using AsyncImage because there are a lot of amiibo and I need to cache each image
            AmiiboRemoteImage(urlString: amiibo.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.brandPrimary, lineWidth: 2)
                )
            
            VStack(alignment: .center, spacing: 5) {
                
                Text(amiibo.name)
                    .foregroundColor(.brandPrimary)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(amiibo.amiiboSeries + " Amiibo Series")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
            .scaledToFit()
            .lineLimit(1)
            
        }
        
    }
    
}

struct AmiiboGridCell_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboGridCell(amiibo: MockData.sampleAmiibo)
    }
}
