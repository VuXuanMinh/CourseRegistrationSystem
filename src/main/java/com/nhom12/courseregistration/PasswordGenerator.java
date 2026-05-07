package com.nhom12.courseregistration;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordGenerator {
    public static void main(String[] args) {
        // Khởi tạo công cụ băm mật khẩu BCrypt
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        // Bạn có thể thay đổi mật khẩu tùy thích ở dòng này
        String rawPassword = "123456";
        
        // Thực hiện băm mật khẩu
        String encodedPassword = encoder.encode(rawPassword);

        // In kết quả ra màn hình Console
        System.out.println("=====================================");
        System.out.println("Mật khẩu gốc: " + rawPassword);
        System.out.println("Chuỗi Hash BCrypt: " + encodedPassword);
        System.out.println("=====================================");
    }
}
