//
//  AmiiboTitleView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 4/8/22.
//

import SwiftUI

struct AmiiboTitleView: View {
    
    var text: String
    
    var body: some View {
        
        Text(text)
            .font(.title)
            .padding(10)
            .background(Color.brandPrimary)
            .cornerRadius(10)
        
    }
    
}

struct AmiiboTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboTitleView(text: "Text")
    }
}
