package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.Faculty;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Long> {
    
}