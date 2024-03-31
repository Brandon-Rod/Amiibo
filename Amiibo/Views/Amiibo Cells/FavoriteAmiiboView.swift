//
//  FavoriteAmiiboView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/28/24.
//

import SwiftUI

struct FavoriteAmiiboView: View {
    
    let amiibo: FavoriteAmiibo
    
    var body: some View {
        
        HStack(spacing: 5) {
            
            CachedImageView(url: amiibo.image) { phase in

                switch phase {

                case .empty:
                    PlaceholderView()

                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .cornerRadius(8)

                case .failure(_):
                    PlaceholderView()

                @unknown default:
                    PlaceholderView()
                    
                }

            }
                        
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
                
                Text(amiibo.amiiboSeries + Constants.amiiboSeries)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
            .padding(.leading)
            
        }
        
    }
    
}

#Preview {
    FavoriteAmiiboView(amiibo: FavoriteAmiibo.example)
}
