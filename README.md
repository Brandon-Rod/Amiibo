# Amiibo

![IMG_6544](https://user-images.githubusercontent.com/61842505/162633417-da2bd989-02d2-4583-a98f-0566a1a9c91f.PNG)

![IMG_6545](https://user-images.githubusercontent.com/61842505/162633422-1e2fd027-05b1-4c5b-af08-834fc31f9eb8.PNG)

## Tecnologies Used
- User Defaults
- NSCasche
- Dark Mode

## Struggle
Since SwiftUI’s lifecycle doesn’t have viewDidLoad(), I had to figure out how to only fetch data from api once when loading the app. Since I use the .onAppear modifier, the api would be called every time I would go on the home tab.  
