//
//  AmiiboApp.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

@main
struct AmiiboApp: App {
    
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.brandPrimary ?? UIColor.black]
        
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            TabBar()
            
        }
        
    }
    
}
