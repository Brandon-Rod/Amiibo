# Amiibo

![Amiibo-Home](https://user-images.githubusercontent.com/61842505/163694780-3702f4f1-b613-4d14-b066-0dd3e050f071.png)

![Amiibo-FavoriteAlert](https://user-images.githubusercontent.com/61842505/163694792-bbd06cb3-05ca-4fd5-88eb-57a35bed1b1a.png)

![Amiibo-Grid](https://user-images.githubusercontent.com/61842505/172969771-93f217ae-4936-44bd-b228-65f8d525fab6.png)

![Amiibo-GridSearch](https://user-images.githubusercontent.com/61842505/172969774-3321dad6-6897-4908-8cab-7087efe42fcd.png)

![Amiibo-Favorites](https://user-images.githubusercontent.com/61842505/163694784-3864dc6d-a220-4a1a-8570-0ad030a8f424.png)


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
- User Defaults
- NSCasche
- Search Functionality 
- Result

## Struggle
Since SwiftUI’s lifecycle doesn’t have viewDidLoad(), I had to figure out how to only fetch data from the api once when loading the app. Since I use the .onAppear modifier, data from the API would be fetched constanalty. 
