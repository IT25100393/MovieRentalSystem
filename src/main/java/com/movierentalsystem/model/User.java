package com.movierentalsystem.model;

import java.io.Serializable;

// Serializable දාන්නේ අපිට මේක file එකකට ලියන්න ලේසි වෙන්න
public abstract class User implements Serializable {
    private String userId;
    private String name;
    private String email;
    private String password;
    protected String membershipType; // Sub classes වලට පේන්න protected දැම්මේ

    // Constructor
    public User(String userId, String name, String email, String password, String membershipType) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.membershipType = membershipType;
    }

    // Getters and Setters (Encapsulation)
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getMembershipType() { return membershipType; }

    // Abstract Method - Polymorphism සඳහා (හැම user කෙනෙක්ම ලොගින් වෙන විදිහ වෙනස් වෙන්න පුළුවන්)
    public abstract boolean authenticate(String email, String password);
}