package com.nhom12.courseregistration.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.CourseOfferingPlan;
import com.nhom12.courseregistration.repository.CourseOfferingPlanRepository;

@Service
public class CourseOfferingPlanService {
    @Autowired
    private CourseOfferingPlanRepository courseOfferingPlanRepository;

    public List<CourseOfferingPlan> getAllCourseOfferingPlans() {
        return courseOfferingPlanRepository.findAll();
    }

    public CourseOfferingPlan getCourseOfferingPlanById(Long id) {
        return courseOfferingPlanRepository.findById(id).orElse(null);
    }

    public void saveCourseOfferingPlan(CourseOfferingPlan plan) {
        courseOfferingPlanRepository.save(plan);
    }

    public void deleteCourseOfferingPlan(Long id) {
        courseOfferingPlanRepository.deleteById(id);
    }
}