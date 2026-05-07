package com.nhom12.courseregistration.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.nhom12.courseregistration.entity.Curriculum;

public interface CurriculumRepository extends JpaRepository<Curriculum, Long> {}
