package com.nhom12.courseregistration.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.Account;


@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {
    
    
    Account findByUsername(String username);
    
    
    boolean existsByUsername(String username);
}
