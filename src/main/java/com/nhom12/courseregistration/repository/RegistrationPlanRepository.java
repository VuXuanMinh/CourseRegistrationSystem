package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.RegistrationPlan;

@Repository
public interface RegistrationPlanRepository extends JpaRepository<RegistrationPlan, Long> {
    boolean existsByPlanCode(String planCode);
}
