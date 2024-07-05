# Tawila
Starting point of a food ordering flutter application

## Architecture
The application follows the best practices of clean architecture by separating the application into three layers, namely: 
#### Data Layer 
  This includes the data sources. For this application data is only obtained from the remote data source (Tawila API), using Retrofit library as a RESTful API client.
  #### Domain Layer
  Repositories are the backbone of the domain layer. As mentioned earlier, in this application data is obtained from the API endpoint. In the future a local database might be used to retain some or all data for a more seamless user experience. Repositories are responsible for handling the logic of obtaining the data from the different data sources as well as validation of local data.
  
#### Presentation Layer
The presentaion layer is responsible of the correct display of different UI elements. Bloc is a famous state management library used in Flutter as the industry standard for state management. In this application Bloc and its components (Events, States) are used for handling the presentaion of business logic.

Additionally, the application utilizes the dependency injection best practice to provide a clean, centralized, and efficient method to manage and maintain the application dependencies.

## Screenshots:

