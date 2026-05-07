package com.nhom12.courseregistration.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.nhom12.courseregistration.entity.Lecturer;

public interface LecturerRepository extends JpaRepository<Lecturer, Long> {}