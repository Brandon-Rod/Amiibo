//
//  AmiiboSingleInfoView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboSingleInfoView: View {
    
    let title: String
    let info: String
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.title3)
                .bold()
            
            Text(info)
            
        }
        
    }
    
}

struct AmiiboSingleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboSingleInfoView(title: "Info:", info: "Mario")
    }
}
