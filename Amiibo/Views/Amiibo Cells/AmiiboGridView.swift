//
//  AmiiboGridView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboGridView: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            CachedImageView(url: amiibo.image) { phase in

                switch phase {
                    
                case .empty:
                    PlaceholderView()

                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.brandPrimary, lineWidth: 2)
                        )

                case .failure(_):
                    PlaceholderView()

                @unknown default:
                    PlaceholderView()
                    
                }

            }
            
            VStack(alignment: .center, spacing: 3) {
                
                Text(amiibo.name)
                    .foregroundColor(.brandPrimary)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(amiibo.amiiboSeries + Constants.amiiboSeries)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
            .scaledToFit()
            .lineLimit(1)
            
        }
        
    }
    
}

struct AmiiboGridView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboGridView(amiibo: MockData.sampleAmiibo)
    }
}
