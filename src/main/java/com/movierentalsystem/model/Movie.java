package com.movierentalsystem.model;

public abstract class Movie {

    // Encapsulation: Private fields
    private String movieId;
    private String title;
    private String genre;
    private String director;
    private int releaseYear;
    private boolean isAvailable;

    public Movie(String movieId, String title, String genre, String director, int releaseYear, boolean isAvailable) {
        this.movieId = movieId;
        this.title = title;
        this.genre = genre;
        this.director = director;
        this.releaseYear = releaseYear;
        this.isAvailable = isAvailable;
    }

    public String getMovieId() { return movieId; }
    public void setMovieId(String movieId) { this.movieId = movieId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public int getReleaseYear() { return releaseYear; }
    public void setReleaseYear(int releaseYear) { this.releaseYear = releaseYear; }

    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }

    public String getDetails() {
        return "ID: " + movieId + " | Title: " + title + " | Genre: " + genre + " | Director: " + director;
    }

    public void updateAvailability(boolean status) {
        this.isAvailable = status;
    }

    public abstract void display();
}