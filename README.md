# Overview
This Flutter application interfaces with the API https://jsonplaceholder.typicode.com/posts to display a list of posts. Each post is initially displayed with a light yellow background, and once clicked, it will open a detailed screen where more information (the post's body) is shown.

# Features Implemented:
- Display Post List: Displays a list of posts fetched from the API.
- Mark as Read: When a user clicks on any list item, it is marked as read, and the background color changes to white.
- Navigate to Detail Screen: When a user clicks on any post, it navigates to a detail screen, displaying the post's description from the body key in the API response.

# Missing Features:
- Timer Functionality
- Local Storage

# Technologies Used:
- Flutter (Latest Version)
- HTTP requests to fetch data from API using http package
- Designed with Clean Architecture
- State management using flutter_bloc package
- Used redacted package for Shimmer effects