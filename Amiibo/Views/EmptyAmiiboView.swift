//
//  EmptyAmiiboView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct EmptyAmiiboView: View {
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image(Constants.placeholder)
                .resizable()
                .scaledToFit()
            
            Text(Constants.emptyAmiibo)
                .font(.title)
            
        }
        
    }
    
}

struct EmptyAmiiboView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyAmiiboView()
    }
}
