package com.movierentalsystem.filehandler;

import com.movierentalsystem.model.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserFileHandler {
    private static final String FILE_PATH = "data/users.txt";

    // User කෙනෙක්ව file එකට save කරන්න (Create)
    public void saveUser(User user) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(user.getUserId() + "," + user.getName() + "," + user.getEmail() + "," + user.getPassword() + "," + user.getMembershipType());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // සේරම users ලව file එකෙන් කියවන්න (Read)
    public List<String> getAllUsers() {
        List<String> users = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                users.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }
}