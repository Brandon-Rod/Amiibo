//
//  AmiiboAlertView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/19/22.
//

import SwiftUI

struct AmiiboAlertView: View {
    
    @Binding var isShowingAlert: Bool
    
    var title: String
    var message: String
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text(title)
                .font(.title3)
            
            Divider()
            
            Text(message)
                .font(.body)
                .multilineTextAlignment(.leading)
            
            Button { withAnimation { isShowingAlert = false } } label: {
                
                AmiiboButton(title: Strings.ok)
                
            }
            
        }
        .padding()
        .frame(maxWidth: 300)
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.8), radius: 5, x: 2, y: 1)
        .overlay(
        
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.brandPrimary, lineWidth: 2)
        
        )

        
    }
    
}

struct AmiiboAlertView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboAlertView(isShowingAlert: .constant(false), title: "Something went wrong.", message: "There was an error doing something.")
    }
}
