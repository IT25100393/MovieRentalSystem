package com.movierentalsystem.model;

// Abstraction: Using an abstract class
public abstract class User {

    // Encapsulation: Making variables private
    private String id;
    private String name;
    private String email;
    private String password;

    // Constructor
    public User(String id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // Encapsulation: Public Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    // Polymorphism: Abstract method to be overridden by subclasses
    public abstract String getUserRole();

    // Method to format data easily for the text file (Notepad)
    public String toFileString() {
        return id + "," + name + "," + email + "," + password + "," + getUserRole();
    }
}
