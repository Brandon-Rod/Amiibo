//
//  SuccessView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboSuccessView: View {
    
    var body: some View {
        
        Text(Constants.successfullyAddedToFavorites)
            .foregroundColor(.brandPrimary)
            .font(.title2)
            .padding()
            .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
        
    }
    
}

struct AmiiboSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboSuccessView()
    }
}
