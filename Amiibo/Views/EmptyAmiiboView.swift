//
//  EmptyAmiiboView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/19/22.
//

import SwiftUI

struct EmptyAmiiboView: View {
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image(Strings.placeholder)
                .resizable()
                .scaledToFit()
            
            Text(Strings.emptyAmiibo)
                .font(.title)
            
        }
        .padding()
        
    }
    
}

struct EmptyAmiiboView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyAmiiboView()
    }
}
