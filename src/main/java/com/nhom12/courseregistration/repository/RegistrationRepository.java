package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.Registration;

@Repository
public interface RegistrationRepository extends JpaRepository<Registration, Long> {
    
}