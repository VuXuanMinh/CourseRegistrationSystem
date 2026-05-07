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

    // Lấy danh sách
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    // Tìm 1 sinh viên theo ID (Dùng cho chức năng Sửa)
    public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }

    // Thêm mới hoặc Cập nhật
    public void saveStudent(Student student) {
        if (student.getId() == null) {
            // Nếu chưa có ID tức là thêm mới
            student.setCreatedAt(LocalDateTime.now());
        } else {
            // Nếu đã có ID tức là sửa
            student.setUpdatedAt(LocalDateTime.now());
        }
        studentRepository.save(student);
    }

    // Xóa
    public void deleteStudent(Long id) {
        studentRepository.deleteById(id);
    }
}
