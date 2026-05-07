package com.nhom12.courseregistration.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom12.courseregistration.entity.TuitionInvoice;
import com.nhom12.courseregistration.repository.TuitionInvoiceRepository;
import com.nhom12.courseregistration.service.TuitionInvoiceService;

@Service
public class TuitionInvoiceServiceImpl implements TuitionInvoiceService {

    @Autowired 
    private TuitionInvoiceRepository tuitionRepository;

    @Override
    public List<TuitionInvoice> getAll() {
        return tuitionRepository.findAll();
    }

    @Override
    public TuitionInvoice getById(Long id) {
        return tuitionRepository.findById(id).orElse(null);
    }

    @Override
    public void save(TuitionInvoice invoice) {
        tuitionRepository.save(invoice);
    }

    @Override
    public void delete(Long id) {
        tuitionRepository.deleteById(id);
    }

    @Override
    public List<TuitionInvoice> getByStudentCode(String code) {
        return tuitionRepository.findByStudent_StudentCode(code);
    }
}