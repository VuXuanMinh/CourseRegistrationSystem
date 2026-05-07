package com.nhom12.courseregistration.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.RegistrationPlan;
import com.nhom12.courseregistration.repository.RegistrationPlanRepository;

@Service
public class RegistrationPlanService {
    @Autowired
    private RegistrationPlanRepository registrationPlanRepository;

    public List<RegistrationPlan> getAllRegistrationPlans() {
        return registrationPlanRepository.findAll();
    }

    public RegistrationPlan getRegistrationPlanById(Long id) {
        return registrationPlanRepository.findById(id).orElse(null);
    }

    public void saveRegistrationPlan(RegistrationPlan plan) {
        registrationPlanRepository.save(plan);
    }

    public void deleteRegistrationPlan(Long id) {
        registrationPlanRepository.deleteById(id);
    }
}
