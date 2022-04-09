//
//  LoadingView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
            .scaleEffect(3)
            .padding(30)
            .background(.thinMaterial)
            .cornerRadius(15)
        
    }
    
}
