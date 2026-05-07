package com.nhom12.courseregistration.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom12.courseregistration.entity.ClassSection;
import com.nhom12.courseregistration.entity.Course;
import com.nhom12.courseregistration.entity.RegistrationPlan;
import com.nhom12.courseregistration.entity.Semester;
import com.nhom12.courseregistration.service.ClassSectionService;
import com.nhom12.courseregistration.service.CourseService;
import com.nhom12.courseregistration.service.CurriculumService;
import com.nhom12.courseregistration.service.LecturerService;
import com.nhom12.courseregistration.service.RegistrationPlanService;
import com.nhom12.courseregistration.service.RegistrationService;
import com.nhom12.courseregistration.service.SemesterService;
import com.nhom12.courseregistration.service.SystemLogService;

@Controller
@RequestMapping("/staff/registration")
public class RegistrationManagementController {

    @Autowired private CourseService courseService;
    @Autowired private ClassSectionService classSectionService;
    @Autowired private SemesterService semesterService;
    @Autowired private RegistrationPlanService planService;
    @Autowired private RegistrationService registrationService;
    @Autowired private CurriculumService curriculumService;
    @Autowired private LecturerService lecturerService;
    @Autowired private SystemLogService logService; // Đã thêm

    private void loadBaseData(Model model) {
        model.addAttribute("semesters", semesterService.getAllSemesters());
        model.addAttribute("courses", courseService.getAllCourses());
        model.addAttribute("curriculums", curriculumService.getAll());
        model.addAttribute("lecturers", lecturerService.getAll());
        model.addAttribute("plans", planService.getAllRegistrationPlans()); 
    }

    @GetMapping("/courses")
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "staff/registration/courses";
    }

    @PostMapping("/courses/save")
    public String saveCourse(@ModelAttribute Course course) {
        courseService.saveCourse(course);
        logService.logAction("UPDATE", "Đã cập nhật môn học: " + course.getCourseName());
        return "redirect:/staff/registration/courses";
    }

    @GetMapping("/courses/delete")
    public String deleteCourse(@RequestParam("id") Long id) {
        courseService.deleteCourse(id);
        logService.logAction("DELETE", "Đã xóa môn học ID: " + id);
        return "redirect:/staff/registration/courses";
    }

    @GetMapping("/class-sections")
    public String listClassSections(Model model) {
        model.addAttribute("classSections", classSectionService.getAllClassSections());
        loadBaseData(model);
        return "staff/registration/class-sections";
    }

    @PostMapping("/class-sections/save")
    public String saveClassSection(@ModelAttribute ClassSection section) {
        classSectionService.saveClassSection(section);
        logService.logAction("UPDATE", "Đã cập nhật lớp học phần.");
        return "redirect:/staff/registration/class-sections";
    }

    @GetMapping("/class-sections/delete")
    public String deleteClassSection(@RequestParam("id") Long id) {
        classSectionService.deleteClassSection(id);
        logService.logAction("DELETE", "Đã xóa lớp học phần ID: " + id);
        return "redirect:/staff/registration/class-sections";
    }

    @GetMapping("/semesters")
    public String listSemesters(Model model) {
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "staff/registration/semesters";
    }

    @PostMapping("/semesters/save")
    public String saveSemester(@ModelAttribute Semester semester) {
        semesterService.saveSemester(semester);
        logService.logAction("UPDATE", "Đã cập nhật học kỳ.");
        return "redirect:/staff/registration/semesters";
    }

    @GetMapping("/semesters/delete")
    public String deleteSemester(@RequestParam("id") Long id) {
        semesterService.deleteSemester(id);
        logService.logAction("DELETE", "Đã xóa học kỳ ID: " + id);
        return "redirect:/staff/registration/semesters";
    }

    @GetMapping("/plans")
    public String listPlans(Model model) {
        model.addAttribute("plans", planService.getAllRegistrationPlans());
        loadBaseData(model);
        return "staff/registration/plans";
    }

    @PostMapping("/plans/save")
    public String savePlan(@ModelAttribute RegistrationPlan plan) {
        planService.saveRegistrationPlan(plan);
        logService.logAction("UPDATE", "Đã cập nhật kế hoạch đăng ký.");
        return "redirect:/staff/registration/plans";
    }

    @GetMapping("/plans/delete")
    public String deletePlan(@RequestParam("id") Long id) {
        planService.deleteRegistrationPlan(id);
        logService.logAction("DELETE", "Đã xóa đợt đăng ký ID: " + id);
        return "redirect:/staff/registration/plans";
    }

    @GetMapping("/results")
    public String listResults(Model model) {
        model.addAttribute("registrations", registrationService.getAll());
        model.addAttribute("classSections", classSectionService.getAllClassSections());
        return "staff/registration/results";
    }

    @GetMapping("/cancel")
    public String cancelRegistration(@RequestParam("id") Long id) {
        registrationService.cancelRegistration(id);
        logService.logAction("DELETE", "Đã hủy kết quả phân lớp/đăng ký ID: " + id);
        return "redirect:/staff/registration/results";
    }
}