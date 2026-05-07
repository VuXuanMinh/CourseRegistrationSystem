package com.nhom12.courseregistration.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.Account;
import com.nhom12.courseregistration.entity.ActivityLog;
import com.nhom12.courseregistration.repository.ActivityLogRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class SystemLogService {
    @Autowired private ActivityLogRepository logRepository;
    @Autowired private HttpSession session;
    @Autowired private HttpServletRequest request; // Dùng để lấy IP

    public void logAction(String action, String details) {
        ActivityLog log = new ActivityLog();
        
        Account currentUser = (Account) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            log.setUserId(currentUser.getId());
            log.setUserType(currentUser.getRole());
        } else {
            log.setUserType("GUEST");
        }
        
        log.setAction(action);
        log.setDetailData(details);
        log.setIpAddress(request.getRemoteAddr()); // Lấy IP người dùng
        
        logRepository.save(log);
    }
}