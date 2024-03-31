//
//  Constants.swift
//  Amiibo
//
//  Created by Brandon Rodriguez on 3/22/22.
//

import Foundation

enum Constants {
    
    /* HomeView */
    static let homeTag = "HomeTag"
    static let homeTitle = "Amiibo"
    static let emptyAmiibo = "There aren't any amiibo in favorites. Consider adding one."
    
    /* HomeDetailView */
    static let addToFavorites = "Add To Favorites"
    static let success = "Success!"
    static let successfullyAddedToFavorites = "Successfully added to favorites"
    
    /* FavoritesView */
    static let favoritesTag = "FavoritesTag"
    static let favorites = "Favorites"
    
    /* Amiibo */
    static let amiiboSeries = " Amiibo Series"
    static let notAvailable =  "Not Available"
    
    /* AmiiboGroupInfoView*/
    static let name = "Name:"
    static let gameSeries = "Game Series:"
    static let amiiboSeriesGI = "Amiibo Series:"
    static let type = "Amiibo Series:"
    
    /* AmiiboReleaseDatesGroupView */
    static let australiaDP = "Australia:"
    static let europeDP = "Europe:"
    static let japanDP = "Japan:"
    static let northAmericaDP = "North America:"
    
    /* ReleaseDate */
    static let releaseDate = "Release Date"
    static let australia = "Australia: "
    static let europe = "Europe: "
    static let japan = "Japan: "
    static let northAmerica = "North America: "
    
    /* AmiiboErrorView */
    static let somethingWentWrong = "Something Went Wrong"
    static let error = "Error"
    
    /* NetworkManager */
    static let serverError = "Server Error"
    static let invalidURL = "The URL is invalid."
    static let invalidResponse = "There was an invalid response from the server. Please try again later."
    static let invalidData = "There was an error connecting to the server. Please try again later."
    static let unableToComplete = "Unable to complete your request at this time. Please check your internet connection."
    
    /* PersistenceManager */
    static let alreadyInFavoritesReason = "Amiibo is already in Favorites"
    static let unableToFavoriteReason = "Persistence Error"
    static let alreadyInFavoritesDescription = "You can't favorite them more than once!"
    static let unableToFavoriteDescription = "There was an error favoriting amiibo. Please try again."
    
    /* Extras*/
    static let home = "Home"
    static let brandPrimary = "brandPrimary"
    static let detailBackground = "detailBackground"
    static let text = "text"
    static let background = "background"
    static let placeholder = "amiiboPlaceholder"
    static let ok = "OK"
    
}

enum SFSymbols {
    
    static let grid = "rectangle.grid.3x2"
    static let list = "list.dash"
    static let sort = "arrow.up.arrow.down"
    static let house = "house"
    static let alphabetical = "abc"
    static let figure = "figure.stand"
    static let card = "lanyardcard"
    static let star = "star"
    
}
