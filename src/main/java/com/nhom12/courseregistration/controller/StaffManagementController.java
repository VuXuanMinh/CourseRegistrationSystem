package com.nhom12.courseregistration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom12.courseregistration.entity.Curriculum;
import com.nhom12.courseregistration.entity.Faculty;
import com.nhom12.courseregistration.entity.Lecturer;
import com.nhom12.courseregistration.entity.Student;
import com.nhom12.courseregistration.service.CurriculumService;
import com.nhom12.courseregistration.service.FacultyService;
import com.nhom12.courseregistration.service.LecturerService;
import com.nhom12.courseregistration.service.StudentService;
import com.nhom12.courseregistration.service.SystemLogService;

@Controller
@RequestMapping("/staff")
public class StaffManagementController {

    @Autowired private StudentService studentService;
    @Autowired private FacultyService facultyService;
    @Autowired private LecturerService lecturerService;
    @Autowired private CurriculumService curriculumService;
    @Autowired private SystemLogService logService; // Đã thêm

    private void loadAllData(Model model) {
        model.addAttribute("faculties", facultyService.getAllFaculties());
        model.addAttribute("majors", curriculumService.getAll());
    }

    @GetMapping("/students")
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        loadAllData(model);
        return "staff/info/students"; 
    }

    @GetMapping("/faculties")
    public String listFaculties(Model model) {
        model.addAttribute("faculties", facultyService.getAllFaculties());
        return "staff/info/faculties";
    }

    @GetMapping("/lecturers")
    public String listLecturers(Model model) {
        model.addAttribute("lecturers", lecturerService.getAll());
        loadAllData(model);
        return "staff/info/lecturers";
    }

    @GetMapping("/majors")
    public String listMajors(Model model) {
        model.addAttribute("majors", curriculumService.getAll());
        loadAllData(model);
        return "staff/info/majors";
    }

    @PostMapping("/students/save")
    public String saveStudent(Student student) {
        studentService.saveStudent(student);
        logService.logAction("UPDATE", "Đã cập nhật thông tin sinh viên.");
        return "redirect:/staff/students";
    }

    @PostMapping("/faculties/save")
    public String saveFaculty(Faculty faculty) {
        facultyService.saveFaculty(faculty);
        logService.logAction("UPDATE", "Đã cập nhật thông tin khoa.");
        return "redirect:/staff/faculties";
    }

    @PostMapping("/lecturers/save")
    public String saveLecturer(Lecturer lecturer) {
        lecturerService.save(lecturer);
        logService.logAction("UPDATE", "Đã cập nhật thông tin giảng viên.");
        return "redirect:/staff/lecturers";
    }

    @PostMapping("/majors/save")
    public String saveMajor(Curriculum curriculum) {
        curriculumService.save(curriculum);
        logService.logAction("UPDATE", "Đã cập nhật thông tin ngành học.");
        return "redirect:/staff/majors";
    }

    @GetMapping("/students/delete")
    public String deleteStudent(@RequestParam("id") Long id) {
        studentService.deleteStudent(id);
        logService.logAction("DELETE", "Đã xóa sinh viên ID: " + id);
        return "redirect:/staff/students";
    }

    @GetMapping("/faculties/delete")
    public String deleteFaculty(@RequestParam("id") Long id) {
        facultyService.deleteFaculty(id);
        logService.logAction("DELETE", "Đã xóa khoa ID: " + id);
        return "redirect:/staff/faculties";
    }

    @GetMapping("/lecturers/delete")
    public String deleteLecturer(@RequestParam("id") Long id) {
        lecturerService.delete(id);
        logService.logAction("DELETE", "Đã xóa giảng viên ID: " + id);
        return "redirect:/staff/lecturers";
    }

    @GetMapping("/majors/delete")
    public String deleteMajor(@RequestParam("id") Long id) {
        curriculumService.delete(id);
        logService.logAction("DELETE", "Đã xóa ngành học ID: " + id);
        return "redirect:/staff/majors";
    }
}