package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.CourseOfferingPlan;

@Repository
public interface CourseOfferingPlanRepository extends JpaRepository<CourseOfferingPlan, Long> {
    boolean existsByPlanCode(String planCode);
}