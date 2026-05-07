package com.nhom12.courseregistration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom12.courseregistration.entity.Account;
import com.nhom12.courseregistration.service.AccountService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private AccountService accountService;

    // Khi người dùng gõ /login trên trình duyệt, hiển thị trang đăng nhập
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Tìm và hiển thị file login.html
    }

    // Khi người dùng bấm nút "Đăng nhập" trên Form
    @PostMapping("/login")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               Model model) {
        
        // Gọi Service để kiểm tra
        Account account = accountService.checkLogin(username, password);

        if (account != null) {
            // Lưu thông tin người dùng vào "phiên làm việc" (Session) để ghi nhớ
            session.setAttribute("loggedInUser", account);
            return "redirect:/home"; // Đăng nhập thành công, chuyển hướng đến trang chủ
        } else {
            // Nếu sai, gửi thông báo lỗi ra ngoài View
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            return "login"; // Ở lại trang đăng nhập
        }
    }

    
}
