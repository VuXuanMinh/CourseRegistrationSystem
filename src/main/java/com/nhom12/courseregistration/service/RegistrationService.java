package com.nhom12.courseregistration.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.Registration;
import com.nhom12.courseregistration.entity.ClassSection;
import com.nhom12.courseregistration.repository.RegistrationRepository;
import com.nhom12.courseregistration.repository.ClassSectionRepository;

@Service
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    @Autowired
    private ClassSectionRepository classSectionRepository;

    // Đổi tên thành getAll() để khớp với các Service khác của bạn
    public List<Registration> getAll() {
        return registrationRepository.findAll();
    }

    public void cancelRegistration(Long registrationId) {
        Registration registration = registrationRepository.findById(registrationId).orElse(null);
        
        // Sửa getStatus -> getRegistrationStatus để khớp với pattern Entity của bạn
        if (registration != null && !"CANCELLED".equals(registration.getRegistrationStatus())) {
            
            registration.setRegistrationStatus("CANCELLED");
            registrationRepository.save(registration);
            
            // Nhả lại sĩ số
            ClassSection section = registration.getClassSection();
            if (section != null && section.getCurrentCapacity() > 0) {
                section.setCurrentCapacity(section.getCurrentCapacity() - 1);
                classSectionRepository.save(section);
            }
        }
    }
}
