//
//  PlaceholderView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct PlaceholderView: View {
    
    var body: some View {
        
        ZStack {
            
            Image(Constants.placeholder)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.brandPrimary, lineWidth: 2)
                )
            
            ProgressView()
                .scaleEffect(2)
            
        }
        
    }
    
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
