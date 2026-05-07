package com.nhom12.courseregistration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
// Bạn cần tạo ActivityLogRepository kế thừa JpaRepository trước nhé
import com.nhom12.courseregistration.repository.ActivityLogRepository;

@Controller
@RequestMapping("/staff/logs")
public class SystemLogController {

    @Autowired
    private ActivityLogRepository logRepository;

    @GetMapping("")
    public String viewLogs(Model model) {
        // Lấy danh sách log và sắp xếp mới nhất lên đầu
        // Tốt nhất trong Repository bạn nên viết hàm: findAllByOrderByCreatedAtDesc()
        model.addAttribute("logs", logRepository.findAll()); 
        return "staff/info/activity-logs";
    }
}