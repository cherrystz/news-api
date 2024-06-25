# NewsAPI App

A simple iOS application that fetches and displays news articles from a remote API. The app supports searching through the articles and displays them in a list. Clicking on an article navigates to a detailed view of the article.

## Features

- Fetch news articles from a remote API.
- Display news articles in a list.
- Search functionality to filter news articles by title.
- Detailed view for each news article.

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/yourusername/NewsAPI.git
    cd NewsAPI
    ```

2. **Open the project in Xcode:**

    ```sh
    open NewsAPI.xcodeproj
    ```

3. **Run the app:**

    Select your target device or simulator and press `Cmd + R` to build and run the project.

## Architecture

This project follows the MVVM (Model-View-ViewModel) architecture pattern, which helps to separate the concerns of data handling, UI presentation, and business logic.

- **Model:** Represents the data structures and includes the `Article` model.
- **ViewModel:** Handles the business logic and prepares data for the view. Includes `NewsListViewModel` and `NewsDetailViewModel`.
- **View:** Displays the UI components. Includes `NewsListView`, `NewsDetailView`, and custom views like `NewsRowView` and `NewsProgressView`.

> Created For Testing, Pharuthapol 2024 

