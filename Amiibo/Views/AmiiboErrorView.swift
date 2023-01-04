//
//  AmiiboErrorView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

import SwiftUI

struct AmiiboErrorView: View {
    
    @Binding var isShowingError: Bool
    
    let title: String?
    let message: String?
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text(title ?? Constants.somethingWentWrong)
            
            Divider()
            
            Text(message ?? Constants.error)
                        
            Button { withAnimation(.easeOut) { isShowingError = false  }} label: {
                
                AmiiboButtonView(title: Constants.ok)
                
            }

            
        }
        .padding()
        .frame(maxWidth: 300)
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 3)
        .overlay(
        
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.brandPrimary, lineWidth: 2)
        
        )
        
    }
    
}

struct AmiiboErrorView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboErrorView(isShowingError: .constant(true), title: "Server Error", message: "There was an error doing something.")
    }
}
