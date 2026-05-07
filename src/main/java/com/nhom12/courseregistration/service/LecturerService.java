package com.nhom12.courseregistration.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.Lecturer;
import com.nhom12.courseregistration.repository.LecturerRepository;

@Service
public class LecturerService {

    @Autowired
    private LecturerRepository lecturerRepository;

    public List<Lecturer> getAll() {
        return lecturerRepository.findAll();
    }

    public Lecturer getById(Long id) {
        return lecturerRepository.findById(id).orElse(null);
    }

    public void save(Lecturer lecturer) {
        if (lecturer.getId() == null) {
            lecturer.setCreatedAt(LocalDateTime.now());
        } else {
            lecturer.setUpdatedAt(LocalDateTime.now());
        }
        lecturerRepository.save(lecturer);
    }

    public void delete(Long id) {
        lecturerRepository.deleteById(id);
    }
}