package com.movierentalsystem.filehandler;

import com.movierentalsystem.model.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserFileHandler {
    private static final String FILE_PATH = "data/users.txt";

    // User කෙනෙක්ව file එකේ අන්තිමට ලියන්න
    public void saveUser(User user) {
        // BufferedWriter පාවිච්චි කරලා ලේසියෙන් file එකට ලියන්න පුළුවන්
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String userData = user.getUserId() + "," + user.getName() + "," +
                    user.getEmail() + "," + user.getPassword() + "," +
                    user.getMembershipType();
            bw.write(userData);
            bw.newLine();
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
        }
    }

    // File එකේ ඉන්න සේරම users ලව කියවන්න
    public List<String> getAllUsers() {
        List<String> users = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                users.add(line);
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }
        return users;
    }
}