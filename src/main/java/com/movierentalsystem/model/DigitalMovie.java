package com.movierentalsystem.model;

public class DigitalMovie extends Movie {

    private String streamingUrl;
    private double fileSize; // GB walin
    private String resolution; // e.g., 1080p, 4K

    public DigitalMovie(String movieId, String title, String genre, String director, int releaseYear, boolean isAvailable, String streamingUrl, double fileSize, String resolution) {
        super(movieId, title, genre, director, releaseYear, isAvailable);
        this.streamingUrl = streamingUrl;
        this.fileSize = fileSize;
        this.resolution = resolution;
    }

    public String getStreamingUrl() { return streamingUrl; }
    public void setStreamingUrl(String streamingUrl) { this.streamingUrl = streamingUrl; }

    public double getFileSize() { return fileSize; }
    public void setFileSize(double fileSize) { this.fileSize = fileSize; }

    public String getResolution() { return resolution; }
    public void setResolution(String resolution) { this.resolution = resolution; }

    public String getStreamingLink() {
        return "Watch now at: " + streamingUrl;
    }

    public void updateResolution(String newResolution) {
        this.resolution = newResolution;
    }

    @Override
    public void display() {
        System.out.println("--- Digital Movie Details ---");
        System.out.println(getDetails());
        System.out.println("Resolution: " + resolution + " | Size: " + fileSize + "GB | URL: " + streamingUrl);
    }
}