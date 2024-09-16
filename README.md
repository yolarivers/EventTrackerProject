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



![ER Diagram](https://github.com/user-attachments/assets/30336a89-7ffc-4316-9ed4-280396a15aed)


# Museum and Artwork Management ER Diagram

This ER diagram shows the relationships between entities in a **Museum and Artwork Management System**:

## Museum
- Contains museum details like name, location, and website.
- One-to-many relationship with exhibitions.

## Exhibition
- Holds exhibition details like title, dates, and description.
- Linked to a museum and can contain multiple artworks.

## Artwork
- Includes artwork details such as title, artist, and creation year.
- Linked to both a museum and an exhibition.

## User
- Stores user account details (username, email, password).
- Can favorite exhibitions or artworks and leave reviews.

## Favorite
- Allows users to save exhibitions and artworks as favorites.

## Review
- Allows users to rate and review exhibitions and artworks.

Each entity connects through foreign keys, facilitating relationships between museums, exhibitions, artworks, and users.

