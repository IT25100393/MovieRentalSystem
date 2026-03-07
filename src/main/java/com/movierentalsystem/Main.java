package com.movierentalsystem;

import com.movierentalsystem.filehandler.MovieFileHandler;
import com.movierentalsystem.model.DigitalMovie;
import com.movierentalsystem.model.Movie;
import com.movierentalsystem.model.PhysicalDVD;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("Starting Movie Management Test...\n");
        System.out.println("Exact file path is: " + new java.io.File("data/movies.txt").getAbsolutePath());

        // File Handler object eka hadagannawa
        MovieFileHandler fileHandler = new MovieFileHandler();

        // 1. Create - Test karanna dummy movies dekak hadamu
        PhysicalDVD dvd1 = new PhysicalDVD("M001", "Inception", "Sci-Fi", "Christopher Nolan", 2010, true, "DVD-001", "Good", "Shelf A1");
        DigitalMovie dig1 = new DigitalMovie("M002", "The Matrix", "Action", "Lana Wachowski", 1999, true, "http://matrix.stream", 4.5, "1080p");

        System.out.println("--- Testing Save Operation ---");
        fileHandler.saveMovie(dvd1);
        fileHandler.saveMovie(dig1);

        // 2. Read - Text file eken data tika aye read karala print karamu
        System.out.println("\n--- Testing Load Operation ---");
        List<Movie> savedMovies = fileHandler.loadMovies();

        for (Movie movie : savedMovies) {
            // Polymorphism wada karana widiya balanna (PhysicalDVD da DigitalMovie da kiyala eya auto anduragena display() run karanawa)
            movie.display();
            System.out.println();
        }

        System.out.println("Test completed successfully!");
    }
}