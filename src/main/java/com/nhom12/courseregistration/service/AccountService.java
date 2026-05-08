package com.nhom12.courseregistration.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.Account; 
import com.nhom12.courseregistration.repository.AccountRepository;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;


    @Autowired
    private PasswordEncoder passwordEncoder;

    public Account checkLogin(String username, String password) {
        Account account = accountRepository.findByUsername(username);
        
        
        if (account != null && passwordEncoder.matches(password, account.getPasswordHash())) {
            return account; 
        }
        return null; 
    }
}