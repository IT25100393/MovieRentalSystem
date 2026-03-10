package com.movierentalsystem.filehandler;

import com.movierentalsystem.model.DigitalMovie;
import com.movierentalsystem.model.Movie;
import com.movierentalsystem.model.PhysicalDVD;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MovieFileHandler {

    // FILE_PATH eka me widiyata define karanna ona
    private static final String FILE_PATH = "data/movies.txt";

    // 1. Create - Aluth movie ekak text file ekata save kirima
    public void saveMovie(Movie movie) {
        File file = new File(FILE_PATH);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file, true))) {
            String line = "";

            if (movie instanceof PhysicalDVD) {
                PhysicalDVD dvd = (PhysicalDVD) movie;
                line = "DVD," + dvd.getMovieId() + "," + dvd.getTitle() + "," + dvd.getGenre() + ","
                        + dvd.getDirector() + "," + dvd.getReleaseYear() + "," + dvd.isAvailable() + ","
                        + dvd.getDvdCode() + "," + dvd.getCondition() + "," + dvd.getShelfLocation();
            } else if (movie instanceof DigitalMovie) {
                DigitalMovie digital = (DigitalMovie) movie;
                line = "DIGITAL," + digital.getMovieId() + "," + digital.getTitle() + "," + digital.getGenre() + ","
                        + digital.getDirector() + "," + digital.getReleaseYear() + "," + digital.isAvailable() + ","
                        + digital.getStreamingUrl() + "," + digital.getFileSize() + "," + digital.getResolution();
            }

            bw.write(line);
            bw.newLine();
            System.out.println("Movie successfully saved to file!");

        } catch (IOException e) {
            System.out.println("Error saving movie: " + e.getMessage());
        }
    }

    // 2. Read - Text file eke thiyena okkoma movies tika list ekakata ganeema
    public List<Movie> loadMovies() {
        List<Movie> movieList = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return movieList;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length < 7) continue;

                String type = data[0];
                String id = data[1];
                String title = data[2];
                String genre = data[3];
                String director = data[4];
                int year = Integer.parseInt(data[5]);
                boolean isAvailable = Boolean.parseBoolean(data[6]);

                if (type.equals("DVD") && data.length >= 10) {
                    PhysicalDVD dvd = new PhysicalDVD(id, title, genre, director, year, isAvailable, data[7], data[8], data[9]);
                    movieList.add(dvd);
                } else if (type.equals("DIGITAL") && data.length >= 10) {
                    DigitalMovie digital = new DigitalMovie(id, title, genre, director, year, isAvailable, data[7], Double.parseDouble(data[8]), data[9]);
                    movieList.add(digital);
                }
            }
        } catch (IOException e) {
            System.out.println("Error loading movies: " + e.getMessage());
        }
        return movieList;
    }

    // 3. Delete - File eken movie ekak ain kirima
    public void deleteMovie(String movieId) {
        List<Movie> movies = loadMovies();
        boolean removed = movies.removeIf(m -> m.getMovieId().equals(movieId));

        if (removed) {
            rewriteFile(movies);
            System.out.println("Movie deleted successfully!");
        } else {
            System.out.println("Movie ID not found.");
        }
    }

    // 4. Update - Movie eke details wenas kirima
    public void updateMovie(Movie updatedMovie) {
        List<Movie> movies = loadMovies();
        boolean updated = false;

        for (int i = 0; i < movies.size(); i++) {
            if (movies.get(i).getMovieId().equals(updatedMovie.getMovieId())) {
                movies.set(i, updatedMovie);
                updated = true;
                break;
            }
        }

        if (updated) {
            rewriteFile(movies);
            System.out.println("Movie updated successfully!");
        } else {
            System.out.println("Movie ID not found for update.");
        }
    }

    private void rewriteFile(List<Movie> movies) {
        try (PrintWriter pw = new PrintWriter(new FileWriter(FILE_PATH, false))) {
            // File eka clear karanawa
        } catch (IOException e) {
            System.out.println("Error clearing file: " + e.getMessage());
        }

        for (Movie movie : movies) {
            saveMovie(movie);
        }
    }
}