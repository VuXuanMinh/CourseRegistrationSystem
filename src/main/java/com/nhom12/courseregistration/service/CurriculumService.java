package com.nhom12.courseregistration.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.Curriculum;
import com.nhom12.courseregistration.repository.CurriculumRepository;

@Service
public class CurriculumService {

    @Autowired
    private CurriculumRepository curriculumRepository;

    public List<Curriculum> getAll() {
        return curriculumRepository.findAll();
    }

    public Curriculum getById(Long id) {
        return curriculumRepository.findById(id).orElse(null);
    }

    public void save(Curriculum curriculum) {
        if (curriculum.getId() == null) {
            curriculum.setCreatedAt(LocalDateTime.now());
        } else {
            curriculum.setUpdatedAt(LocalDateTime.now());
        }
        curriculumRepository.save(curriculum);
    }

    public void delete(Long id) {
        curriculumRepository.deleteById(id);
    }
}