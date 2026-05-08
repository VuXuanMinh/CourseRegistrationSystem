package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {
    
    boolean existsByCourseCode(String courseCode);
}
