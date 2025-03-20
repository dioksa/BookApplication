# BookApplication

This project demonstrates the usage of SwiftUI to build a native iOS application that fetches JSON data from an API and displays it in a structured and visually appealing way. The app handles the hierarchical structure of JSON data that consists of pages, sections, and questions. It also supports loading and UI updates with smooth animations.

## Features
- Fetch JSON data from the API:
  - https://run.mocky.io/v3/9b27a9ff-886d-42b6-9501-950e1fd1598b
- Dynamic display of Pages, Sections, and Questions with proper hierarchy-based font sizes:
  - Pages: Largest font size
  - Sections: Medium font size
  - Questions: Smallest font size
- Text-based questions are displayed as plain text.
- Image-based questions:
  - Displays a small version of the image.
  - Clicking the image opens a new screen to view the full-sized image along with its title.

## Architecture
The app uses SwiftUI for the UI and the MVVM design pattern:

- Model: Represents the structure of the JSON data, including Pages, Sections, and Questions.
- ViewModel: Responsible for fetching, decoding, and managing the data for display.
- View: Displays the structured content of the app.

## Requirements
- Xcode 15.0+
- Swift 5.0+
- iOS 18.0+

## Installation

To run this project locally:

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/book-application.git

2. Open the project in Xcode using the .xcodeproj file:
   ```bash
   open BookApplication.xcodeproj

3. Build and run the project on your desired simulator or device.

## API Used
The application fetches JSON data from the following endpoint:

[Mocky API Endpoint](https://run.mocky.io/v3/d403fba7-413f-40d8-bec2-afe6ef4e201e)

## Explanation:
- Pages: Contains sections or questions.
- Sections: Can have nested sections or questions.
- Questions: Can be of type text or image.

## Usage
- Viewing Pages and Sections
  - The app displays pages at the highest level, followed by sections.
  - Pages and sections are shown with the appropriate font size based on their hierarchical level.
- Handling Questions
  - Text questions are shown directly.
  - Image questions are displayed with a thumbnail. Tapping on an image opens a detailed view with the full-sized image.
- Refreshing Data
  - Pull down on the screen to refresh the data.

## Contact
You can reach me at atty.ltd@gmail.com or visit my GitHub profile [dioksa](https://github.com/dioksa)
