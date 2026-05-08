package com.nhom12.courseregistration.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.Student;
import com.nhom12.courseregistration.repository.StudentRepository;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }


    public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }

    
    public void saveStudent(Student student) {
        if (student.getId() == null) {
            // Nếu chưa có ID tức là thêm mới
            student.setCreatedAt(LocalDateTime.now());
        } else {
           
            student.setUpdatedAt(LocalDateTime.now());
        }
        studentRepository.save(student);
    }

   
    public void deleteStudent(Long id) {
        studentRepository.deleteById(id);
    }
}
