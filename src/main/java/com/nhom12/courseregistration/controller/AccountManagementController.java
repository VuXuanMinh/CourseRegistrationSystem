package com.nhom12.courseregistration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom12.courseregistration.entity.Account;
import com.nhom12.courseregistration.repository.AccountRepository;
import com.nhom12.courseregistration.service.StudentService;
import com.nhom12.courseregistration.service.SystemLogService;

@Controller
@RequestMapping("/staff/accounts")
public class AccountManagementController {

    @Autowired private AccountRepository accountRepository;
    @Autowired private StudentService studentService;
    @Autowired private SystemLogService logService; // Đã thêm

    @GetMapping("")
    public String listAccounts(Model model) {
        model.addAttribute("accounts", accountRepository.findAll());
        model.addAttribute("students", studentService.getAllStudents());
        return "staff/info/accounts"; 
    }

    @PostMapping("/save")
    public String saveAccount(Account account) {
        if (account.getStudent() != null && account.getStudent().getId() == null) {
            account.setStudent(null);
        }
        accountRepository.save(account);
        
        
        logService.logAction("UPDATE", "Đã lưu thông tin tài khoản: " + account.getUsername());
        
        return "redirect:/staff/accounts";
    }

    @GetMapping("/delete")
    public String deleteAccount(@RequestParam("id") Long id) {
        accountRepository.deleteById(id);
        
    
        logService.logAction("DELETE", "Đã xóa/khóa tài khoản có ID: " + id);
        
        return "redirect:/staff/accounts";
    }
}
