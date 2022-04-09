//
//  Alert.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 8/11/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

struct AlertContext {
    
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid. Please contact support."), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later or contact support."), dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server. If this persists, please contact support."), dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Please check your internet connection."), dismissButton: .default(Text("OK")))
    
    static let unableToFavorite = AlertItem(title: Text("Persistence Error"), message: Text("There was an error favoriting amiibo. Please try again."), dismissButton: .default(Text("OK")))
    
    static let alreadyInFavorites = AlertItem(title: Text("Amiibo all ready in favorites"), message: Text("You can't favorite them more than once!"), dismissButton: .default(Text("OK")))
    
    static let invalidUsername = AlertItem(title: Text("Invalid Username"), message: Text("Unable to save  amiibo."), dismissButton: .default(Text("OK")))
    
}
