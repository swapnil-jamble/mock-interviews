package com.nil.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordHashGenerator {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String rawPassword = "MockInterview";
        String encodedPassword = encoder.encode(rawPassword);
        System.out.println("Hashed password: " + encodedPassword);
    }
}
