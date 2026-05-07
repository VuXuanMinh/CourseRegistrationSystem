package com.nhom12.courseregistration.service;

import java.util.List;

import com.nhom12.courseregistration.entity.TuitionInvoice;

public interface TuitionInvoiceService {
    List<TuitionInvoice> getAll();
    TuitionInvoice getById(Long id);
    void save(TuitionInvoice invoice);
    void delete(Long id);
    List<TuitionInvoice> getByStudentCode(String code);
}
