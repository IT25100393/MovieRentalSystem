package com.movierentalsystem.model;

// Inheritance
public class PremiumUser extends User {

    public PremiumUser(String id, String name, String email, String password) {
        super(id, name, email, password);
    }

    // Polymorphism
    @Override
    public String getUserRole() {
        return "Premium";
    }
}
