package com.nhom12.courseregistration.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhom12.courseregistration.entity.TuitionInvoice;

@Repository
public interface TuitionInvoiceRepository extends JpaRepository<TuitionInvoice, Long> {
    
    List<TuitionInvoice> findByStudent_StudentCode(String studentCode);
    
    
    List<TuitionInvoice> findBySemester_Id(Long semesterId);
}