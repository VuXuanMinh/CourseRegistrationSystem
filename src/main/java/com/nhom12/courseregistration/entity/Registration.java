package com.nhom12.courseregistration.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient; // BẮT BUỘC PHẢI CÓ DÒNG NÀY

@Entity
@Table(name = "registrations")
public class Registration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @ManyToOne
    @JoinColumn(name = "section_id")
    private ClassSection section;

    @Column(name = "registration_status")
    private String registrationStatus;

    // DÙNG @Transient ĐỂ SPRING BOOT BỎ QUA CỘT NÀY DƯỚI DATABASE
    @Transient
    private LocalDateTime registrationTime;

    // --- Getter và Setter ---
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public Student getStudent() { return student; }
    public void setStudent(Student student) { this.student = student; }
    
    public ClassSection getSection() { return section; }
    public void setSection(ClassSection section) { this.section = section; }
    
    public String getRegistrationStatus() { return registrationStatus; }
    public void setRegistrationStatus(String registrationStatus) { this.registrationStatus = registrationStatus; }
    
    public LocalDateTime getRegistrationTime() { return registrationTime; }
    public void setRegistrationTime(LocalDateTime registrationTime) { this.registrationTime = registrationTime; }

    public ClassSection getClassSection() {
        return this.section; 
    }

    public void setClassSection(ClassSection classSection) {
        this.section = classSection;
    }
}