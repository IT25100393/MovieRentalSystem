package com.movierentalsystem.model;

// Inheritance: Extends the User super class
public class RegularUser extends User {

    public RegularUser(String id, String name, String email, String password) {
        // Calling the super class constructor
        super(id, name, email, password);
    }

    // Polymorphism: Overriding the abstract method
    @Override
    public String getUserRole() {
        return "Regular";
    }

}
