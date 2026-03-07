package com.movierentalsystem.model;

public class PhysicalDVD extends Movie {

    private String dvdCode;
    private String condition;
    private String shelfLocation;

    public PhysicalDVD(String movieId, String title, String genre, String director, int releaseYear, boolean isAvailable, String dvdCode, String condition, String shelfLocation) {

        super(movieId, title, genre, director, releaseYear, isAvailable);
        this.dvdCode = dvdCode;
        this.condition = condition;
        this.shelfLocation = shelfLocation;
    }

    public String getDvdCode() { return dvdCode; }
    public void setDvdCode(String dvdCode) { this.dvdCode = dvdCode; }

    public String getCondition() { return condition; }
    public void setCondition(String condition) { this.condition = condition; }

    public String getShelfLocation() { return shelfLocation; }
    public void setShelfLocation(String shelfLocation) { this.shelfLocation = shelfLocation; }

    public String checkCondition() {
        return "DVD Condition is: " + condition;
    }

    public void updateCondition(String newCondition) {
        this.condition = newCondition;
    }

    @Override
    public void display() {
        System.out.println("--- Physical DVD Details ---");
        System.out.println(getDetails());
        System.out.println("DVD Code: " + dvdCode + " | Shelf: " + shelfLocation + " | Condition: " + condition);
    }
}