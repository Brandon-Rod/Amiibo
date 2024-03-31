//
//  AmiiboAlreadyInFavoritesView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/30/24.
//

import SwiftUI

struct AmiiboAlreadyInFavoritesView: View {
    
    var body: some View {
        
        Text("Amiibo is already in favorites")
            .foregroundColor(.red)
            .font(.title2)
            .padding()
            .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
        
    }
    
}

#Preview {
    AmiiboAlreadyInFavoritesView()
}
