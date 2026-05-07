package com.nhom12.courseregistration.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.ClassSection;
import com.nhom12.courseregistration.repository.ClassSectionRepository;

@Service
public class ClassSectionService {
    @Autowired
    private ClassSectionRepository classSectionRepository;

    public List<ClassSection> getAllClassSections() {
        return classSectionRepository.findAll();
    }

    public ClassSection getClassSectionById(Long id) {
        return classSectionRepository.findById(id).orElse(null);
    }

    public void saveClassSection(ClassSection classSection) {
        classSectionRepository.save(classSection);
    }

    public void deleteClassSection(Long id) {
        classSectionRepository.deleteById(id);
    }
}