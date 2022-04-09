//
//  AmiiboButton.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/19/22.
//

import SwiftUI

struct AmiiboButton: View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(.title3)
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.brandPrimary)
            .cornerRadius(10)
        
    }
    
}

struct AmiiboButton_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboButton(title: "Add to favorites")
    }
}
