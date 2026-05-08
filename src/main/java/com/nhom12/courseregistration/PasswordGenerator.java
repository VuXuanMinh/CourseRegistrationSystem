package com.nhom12.courseregistration;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordGenerator {
    public static void main(String[] args) {
        
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        
        String rawPassword = "123456";
        

        String encodedPassword = encoder.encode(rawPassword);

    
        System.out.println("=====================================");
        System.out.println("Mật khẩu gốc: " + rawPassword);
        System.out.println("Chuỗi Hash BCrypt: " + encodedPassword);
        System.out.println("=====================================");
    }
}
