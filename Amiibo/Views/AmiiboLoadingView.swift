//
//  LoadingView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboLoadingView: View {
    
    var body: some View {
        
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
            .scaleEffect(3)
            .padding(30)
            .background(.thinMaterial)
            .cornerRadius(15)
        
    }
    
}

struct AmiiboLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboLoadingView()
    }
}
