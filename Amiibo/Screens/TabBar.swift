//
//  TabBar.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/14/22.
//

import SwiftUI

struct TabBar: View {
    
    @SceneStorage("selectedView") var selectedView: String?
    
    var body: some View {
        
        TabView(selection: $selectedView) {
            
            AmiiboHomeView()
                .tag(AmiiboHomeView.tag)
                .tabItem {
                    
                    Image(systemName: SFSymbols.house)
                    Text(Constants.home)
                    
                }
            
            FavoritesView()
                .tag(FavoritesView.tag)
                .tabItem {
                    
                    Image(systemName: SFSymbols.star)
                    Text(Constants.favorites)
                    
                }
            
        }
        .accentColor(.brandPrimary)
        
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
