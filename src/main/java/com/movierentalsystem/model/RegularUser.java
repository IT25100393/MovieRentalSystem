package com.movierentalsystem.model;

public class RegularUser extends User {
    private int rentalLimit = 5; // සාමාන්‍ය කෙනෙක්ට කුලියට ගන්න පුළුවන් සීමාව

    public RegularUser(String userId, String name, String email, String password) {
        super(userId, name, email, password, "Regular");
    }

    @Override
    public boolean authenticate(String email, String password) {
        // සරල email/password check එකක්
        return this.getEmail().equals(email) && this.getPassword().equals(password);
    }
}