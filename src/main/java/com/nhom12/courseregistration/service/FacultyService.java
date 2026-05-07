package com.nhom12.courseregistration.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.Faculty;
import com.nhom12.courseregistration.repository.FacultyRepository;

@Service
public class FacultyService {

    @Autowired
    private FacultyRepository facultyRepository;

    public List<Faculty> getAllFaculties() {
        return facultyRepository.findAll();
    }

    public Faculty getFacultyById(Long id) {
        return facultyRepository.findById(id).orElse(null);
    }

    public void saveFaculty(Faculty faculty) {
        if (faculty.getId() == null) {
            faculty.setCreatedAt(LocalDateTime.now());
        } else {
            faculty.setUpdatedAt(LocalDateTime.now());
        }
        facultyRepository.save(faculty);
    }

    public void deleteFaculty(Long id) {
        facultyRepository.deleteById(id);
    }
}