package com.movierentalsystem.model;

public class PremiumUser extends User {
    private double discountRate = 0.20; // 20% discount එකක් තියෙනවා

    public PremiumUser(String userId, String name, String email, String password) {
        super(userId, name, email, password, "Premium");
    }

    @Override
    public boolean authenticate(String email, String password) {
        // Premium අයට සමහරවිට වෙනත් security check එකක් තියෙන්න පුළුවන් (දැනට සරලව ලියමු)
        return this.getEmail().equals(email) && this.getPassword().equals(password);
    }
}