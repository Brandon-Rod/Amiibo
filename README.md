# Amiibo

![List-Rotato](https://user-images.githubusercontent.com/61842505/210621638-e52c6d16-d330-4908-9a4c-7985d06099bb.png)

![AddedToFavorites-Rotato](https://user-images.githubusercontent.com/61842505/210621653-4e03bb7e-f0f2-4be6-9578-e14cd12a1b0f.png)

![Grid-Rotato](https://user-images.githubusercontent.com/61842505/210621677-d255b79f-a1b6-4a5b-b7a8-a97d80e1761d.png)

![Favorites-Rotato](https://user-images.githubusercontent.com/61842505/210621702-b5268ff8-c98f-4b06-805f-46a8fed090cf.png)

## About
- MVVM
- Support for light and dark mode
- Custom Alerts
- Empty State Views
- Error Handling
- RESTful API
- Networking

## Tecnologies Used
- SwiftUI
- XCTest
- User Defaults
- NSCasche
- Search Functionality 
- Result

## Struggle
Since SwiftUI’s lifecycle doesn’t have viewDidLoad(), I had to figure out how to only fetch data from the api once when loading the app. Since I use the .onAppear modifier, data from the API would be fetched constanalty. 
