package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.Account;

// Chú thích @Repository báo cho Spring Boot biết đây là lớp quản lý dữ liệu
@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {
    
    // Spring Boot sẽ tự động dịch tên hàm này thành câu lệnh SQL: 
    // SELECT * FROM accounts WHERE username = ?
    Account findByUsername(String username);
    
    // Tìm kiểm tra xem username đã tồn tại chưa
    boolean existsByUsername(String username);
}
