package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.ClassSection;

@Repository
public interface ClassSectionRepository extends JpaRepository<ClassSection, Long> {
    boolean existsBySectionCode(String sectionCode);
}
