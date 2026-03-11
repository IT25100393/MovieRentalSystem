# MovieFlex - Movie Rental System 🎬

## Component 02: Movie Management

### 📌 Project Overview
This project is a Java EE-based Movie Rental System. Component 02 focuses on the core **Movie Management** module, allowing administrators to manage the movie catalog effectively. The system uses Object Oriented Programming (OOP) concepts like Inheritance and Polymorphism to support two types of movies:
- **Physical DVDs:** Tracks DVD codes, condition, and shelf location.
- **Digital Streams:** Tracks streaming URLs, file size, and resolution.

### 🚀 Features
- **Add Movies:** Dynamic forms to add new Physical DVDs or Digital movies.
- **View Catalog:** A responsive, dark themed UI grid to view all movies and their availability status.
- **Edit/Update:** Pre-filled forms to modify existing movie details.
- **Delete:** Safely remove movies from the system.
- **File-based Storage:** Data is persistently stored using standard Java File I/O (`movies.txt`), ensuring robust data handling without an external database.

### 🛠️ Technologies Used
- **Backend:** Java 17, Servlets, OOP Principles
- **Frontend:** JSP, HTML5, CSS3, Bootstrap 5 (Dark Theme), JavaScript
- **Server:** Apache Tomcat 10.1+
- **Data Storage:** Text File Handling
- **Version Control:** Git & GitHub

### ⚙️ How to Run Locally
1. Clone the repository to your local machine.
2. Open the project in **IntelliJ IDEA**.
3. Configure **Smart Tomcat** in IntelliJ:
    - **Deployment directory:** `src/main/webapp`
    - **Context path:** `/`
    - **Server port:** `8080`
4. Build the project and Start the Tomcat server.
5. Open your browser and navigate to: `http://localhost:8080/MovieServlet?action=view`

---
*Developed as a part of the Object-Oriented Programming Module.*