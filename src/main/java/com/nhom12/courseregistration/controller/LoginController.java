package com.nhom12.courseregistration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom12.courseregistration.entity.Account;
import com.nhom12.courseregistration.service.AccountService;
import com.nhom12.courseregistration.service.SystemLogService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired private AccountService accountService;
    @Autowired private SystemLogService logService; 

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("role") String roleFromForm,
                               HttpSession session,
                               Model model) {
        
        Account account = accountService.checkLogin(username, password);

        if (account != null) {
            if (!account.getRole().equalsIgnoreCase(roleFromForm)) {
                model.addAttribute("error", "Bạn không có quyền truy cập với vai trò này!");
                return "login";
            }

            session.setAttribute("loggedInUser", account);

           
            logService.logAction("LOGIN", "Người dùng [" + username + "] đã đăng nhập thành công.");

            if ("STAFF".equalsIgnoreCase(account.getRole())) {
                return "redirect:/staff/students"; 
            } else if ("STUDENT".equalsIgnoreCase(account.getRole())) {
                return "redirect:/student/home";   
            }
            return "redirect:/home"; 
        } else {
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        
        logService.logAction("LOGOUT", "Người dùng đã đăng xuất khỏi hệ thống.");
        
        session.invalidate(); 
        return "redirect:/login";
    }
}
