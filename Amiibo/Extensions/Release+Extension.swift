//
//  Release+Extension.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import Foundation

extension Release {
    
    var auText: String {
        
        au ?? Constants.notAvailable
        
    }
    
    var euText: String {
        
        eu ?? Constants.notAvailable
        
    }
    
    var jpText: String {
        
        jp ?? Constants.notAvailable
        
    }
    
    var naText: String {
        
        na ?? Constants.notAvailable
        
    }
    
}
