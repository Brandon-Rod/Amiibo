//
//  Release+Extension.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import Foundation

extension Release {
    
    var auText: String {
        
        au ?? Strings.notAvailable
        
    }
    
    var euText: String {
        
        eu ?? Strings.notAvailable
        
    }
    
    var jpText: String {
        
        jp ?? Strings.notAvailable
        
    }
    
    var naText: String {
        
        na ?? Strings.notAvailable
        
    }
    
}
