//
//  AmiiboApp.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

@main
struct AmiiboApp: App {
    
    // Makes the NavigationBar Title foreground color the color of the app.
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.brandPrimary ?? UIColor.black]
        
        
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            AmiiboNavigationView()
            
        }
        
    }
    
}
