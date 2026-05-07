package com.nhom12.courseregistration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom12.courseregistration.entity.TuitionInvoice;
import com.nhom12.courseregistration.service.SemesterService;
import com.nhom12.courseregistration.service.StudentService;
import com.nhom12.courseregistration.service.SystemLogService;
import com.nhom12.courseregistration.service.TuitionInvoiceService;

@Controller
@RequestMapping("/staff/tuitions")
public class TuitionManagementController {

    @Autowired private TuitionInvoiceService tuitionService;
    @Autowired private StudentService studentService;
    @Autowired private SemesterService semesterService;
    @Autowired private SystemLogService logService; // Đã thêm

    private void loadBaseData(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        model.addAttribute("semesters", semesterService.getAllSemesters());
    }

    @GetMapping("")
    public String listTuitions(Model model) {
        model.addAttribute("tuitions", tuitionService.getAll());
        loadBaseData(model);
        return "staff/info/tuitions"; 
    }

    @PostMapping("/save")
    public String saveTuition(TuitionInvoice invoice) {
        tuitionService.save(invoice);
        logService.logAction("UPDATE", "Đã cập nhật hóa đơn học phí.");
        return "redirect:/staff/tuitions";
    }

    @GetMapping("/delete")
    public String deleteTuition(@RequestParam("id") Long id) {
        tuitionService.delete(id);
        logService.logAction("DELETE", "Đã xóa hóa đơn học phí ID: " + id);
        return "redirect:/staff/tuitions";
    }
}
