//
//  AmiiboApp.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI
import SwiftData

@main
struct AmiiboApp: App {
    
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.brandPrimary ?? UIColor.black]
        
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            TabBar()
                .modelContainer(for: FavoriteAmiibo.self)
            
        }
        
    }
    
}
