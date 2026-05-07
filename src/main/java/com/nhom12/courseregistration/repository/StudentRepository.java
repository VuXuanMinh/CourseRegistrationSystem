package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    // JpaRepository đã cung cấp sẵn hàm findAll() để lấy toàn bộ sinh viên
}