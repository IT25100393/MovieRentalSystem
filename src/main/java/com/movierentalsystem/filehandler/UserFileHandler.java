package com.movierentalsystem.filehandler;

import com.movierentalsystem.model.PremiumUser;
import com.movierentalsystem.model.RegularUser;
import com.movierentalsystem.model.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserFileHandler {

    // File path for the notepad text file
    private static final String FILE_PATH = "users.txt";

    public static void saveUser(User user) {

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(user.toFileString());
            bw.newLine(); // Move to the next line
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 2. READ Operation: Get all users from the text file
    public static List<User> getAllUsers() {

        List<User> userList = new ArrayList<>();
        File file = new File(FILE_PATH);

        // File eka nathnam aluth empty list ekak return karanna
        if (!file.exists()) {
            return userList;
        }
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {

                // Comma (,) eken data tika wen karagannawa
                String[] data = line.split(",");
                if (data.length == 5) {

                    // Role eka anuwa hari object eka hadanawa (Polymorphism in action!)
                    if (data[4].equals("Premium")) {
                        userList.add(new PremiumUser(data[0], data[1], data[2], data[3]));
                    } else {
                        userList.add(new RegularUser(data[0], data[1], data[2], data[3]));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return userList;
    }

    // 3. DELETE Operation: Remove a user by email
    public static void deleteUser(String email) {
        List<User> users = getAllUsers();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {

                // Delete karanna ona email eka nemei nam witharak aye file ekata liyanawa
                if (!user.getEmail().equals(email)) {
                    bw.write(user.toFileString());
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}