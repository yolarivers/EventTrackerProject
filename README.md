# EventTrackerProject
# Artisphere

**Artisphere** is a web-based platform where users can track and explore artwork, exhibitions, museums, and post reviews. The frontend is developed using AngularJS and styled with Bootstrap for a modern, responsive user interface, while the backend is built using Spring Boot and MySQL for handling API requests and data storage.

---

## Features

- Browse stunning artwork galleries.
- Explore information about various museums.
- View current and upcoming art exhibitions.
- Post and read reviews about exhibitions, artwork, and museums.
- Dynamic content fetching through RESTful API.

---

## Technology Stack

### Frontend:
- **AngularJS 1.8.2**
- **Bootstrap 5.3.0**
- **HTML5 & CSS3**

### Backend:
- **Spring Boot** (Java)
- **MySQL** (Database)

### Tools:
- **Sublime Text** (for coding)
- **Postman** (for testing API endpoints)

---

## API Endpoints

Here are the key API endpoints to interact with the backend:

### Museums
- `GET /api/museums`: Retrieve a list of museums.
- `POST /api/museums`: Add a new museum.
- `PUT /api/museums/{id}`: Update museum information.
- `DELETE /api/museums/{id}`: Delete a museum.

### Artwork
- `GET /api/artworks`: Get a list of all artwork.
- `POST /api/artworks`: Add a new piece of artwork.
- `PUT /api/artworks/{id}`: Update an artwork.
- `DELETE /api/artworks/{id}`: Delete an artwork.

### Reviews
- `GET /api/reviews`: Fetch all reviews.
- `POST /api/reviews`: Post a new review.
- `PUT /api/reviews/{id}`: Edit an existing review.
- `DELETE /api/reviews/{id}`: Delete a review.

---

## Future Improvements

- **User Authentication**: Add login and signup functionality with user roles (e.g., admins, users).
- **Art Uploads**: Allow users to upload and submit their own artwork.
- **Advanced Search**: Implement search functionality for filtering art, museums, or exhibitions.
- **Image Gallery**: Enhance the photo viewing experience with a modal gallery feature.
- **Pagination**: Implement pagination for the artwork and reviews lists.

---

