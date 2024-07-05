# Tawila
The foundation of this food ordering Flutter app is built on clean architecture, with distinct layers for data, domain, and presentation, ensuring maintainability and scalability.

## Architecture
The application adheres to clean architecture principles by dividing its structure into three distinct layers:
#### Data Layer 
This layer handles all data interactions. For this application, data is fetched exclusively from the remote Tawila API using the Retrofit library as a RESTful API client. This setup ensures efficient and reliable communication with the remote data source.
#### Domain Layer
Repositories form the backbone of the domain layer, managing the complex logic of data retrieval and validation. In this application, data is sourced from the Tawila API. Future enhancements may include a local database to store data, improving user experience. Repositories ensure seamless integration and validation across different data sources, maintaining data consistency and integrity.
  
#### Presentation Layer
The presentation layer ensures the accurate display of UI elements. It uses the Bloc library, a widely recognized standard in Flutter for state management. In this application, Bloc and its components (Events and States) orchestrate the presentation of business logic, ensuring a responsive and consistent user interface.

Additionally, the application utilizes the dependency injection best practice to provide a clean, centralized, and efficient method to manage and maintain the application dependencies.

## Screenshots:

<img src="https://github.com/Ahmedgadein/tawila-task/blob/master/screenshots/tawila_1.jpg" width="200"> <img src="https://github.com/Ahmedgadein/tawila-task/blob/master/screenshots/tawila_2.jpg" width="200"> <img src="https://github.com/Ahmedgadein/tawila-task/blob/master/screenshots/tawila_3.jpg" width="200"> 

## Design Choices:
#### Splash Screen
A simple clean splash screen that displays Tawila logo to introduce the visual identity of the company.

#### Home Screen
In design, I adhere to the "less is more" philosophy, striving for minimalism wherever possible. The visual identity of Tawila is captured through the use of Yellow, Red, and Purple, which are seamlessly integrated into the main screen. The interface prominently features a clean, simple card that showcases essential restaurant details: name, logo, rating, and the availability of delivery and reservations.

## APK:
Available at the apk folder:
https://github.com/Ahmedgadein/tawila-task/tree/master/apk
