//
//  AmiiboButtonView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboButtonView: View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(.title3)
            .foregroundColor(.text)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.brandPrimary)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.8), radius: 3)
        
    }
    
}

struct AmiiboButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboButtonView(title: "Add To Favorites")
    }
}
