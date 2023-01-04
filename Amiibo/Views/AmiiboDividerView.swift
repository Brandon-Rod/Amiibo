//
//  AmiiboDividerView.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 12/30/22.
//

import SwiftUI

struct AmiiboDividerView: View {
    
    let color: Color
    
    var body: some View {
        
        color
            .frame(height: 2)
            .clipShape(Capsule())
        
    }
    
}

struct AmiiboDividerView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDividerView(color: .brandPrimary)
    }
}
