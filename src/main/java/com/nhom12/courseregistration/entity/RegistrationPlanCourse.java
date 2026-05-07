package com.nhom12.courseregistration.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

@Entity
@Table(name = "registration_plan_courses")
public class RegistrationPlanCourse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "is_mandatory", nullable = false)
    private Boolean isMandatory = true;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    // Khóa ngoại
    @ManyToOne
    @JoinColumn(name = "plan_id", nullable = false)
    private RegistrationPlan plan;

    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    // --- GETTER VÀ SETTER ---
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Boolean getIsMandatory() { return isMandatory; }
    public void setIsMandatory(Boolean isMandatory) { this.isMandatory = isMandatory; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public RegistrationPlan getPlan() { return plan; }
    public void setPlan(RegistrationPlan plan) { this.plan = plan; }

    public Course getCourse() { return course; }
    public void setCourse(Course course) { this.course = course; }
    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }


}