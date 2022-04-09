//
//  AmiiboReleaseDate.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 4/8/22.
//

import SwiftUI

struct AmiiboReleaseDate: View {
    
    let amiibo: Amiibo
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            AmiiboTitleView(text: Strings.releaseDate)
            
            Text(Strings.australia) + Text(amiibo.release.auText).foregroundColor(.brandPrimary)
            
            Text(Strings.europe) + Text(amiibo.release.euText).foregroundColor(.brandPrimary)
            
            Text(Strings.japan) + Text(amiibo.release.jpText).foregroundColor(.brandPrimary)
                        
            Text(Strings.northAmerica) + Text(amiibo.release.naText).foregroundColor(.brandPrimary)
                        
        }
        
    }
    
}
