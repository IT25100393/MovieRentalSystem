package com.movierentalsystem.filehandler;

import com.movierentalsystem.model.User;
import java.io.*;

public class UserFileHandler {
    private static final String FILE_PATH = "data/users.txt";

    public void saveUser(User user) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            // CSV format එකට (userId,name,email,password,type) විදිහට save කරනවා
            String record = user.getUserId() + "," + user.getName() + "," +
                    user.getEmail() + "," + user.getPassword() + "," +
                    user.getMembershipType();
            bw.write(record);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}