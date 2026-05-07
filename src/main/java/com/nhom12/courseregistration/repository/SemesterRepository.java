package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.Semester;

@Repository
public interface SemesterRepository extends JpaRepository<Semester, Long> {
    boolean existsBySemesterCode(String semesterCode);
}
