# Amiibo

Amiibo is a SwiftUI app that fetches data from a RESTful api (https://www.amiiboapi.com). 

## Tecnologies Used
User Defaults...
NSCasche
Dark Mode

## Struggle
Since SwiftUI’s lifecycle doesn’t have viewDidLoad(), I had to figure out how to only fetch data from api once when loading the app. Since I use the .onAppear modifier, the api would be called every time I would go on the home tab.  
