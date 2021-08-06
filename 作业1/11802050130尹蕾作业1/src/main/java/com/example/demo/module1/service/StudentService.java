package com.example.demo.module1.service;

import com.example.demo.module1.entity.Student;
import java.util.List;

public interface StudentService {
    public List<Object> findAll() ;
    public Object findById(int id);
    public String add(Student student) ;
    public String update(Student student) ;
    public String delete(Student student) ;
    public String delete(int id);
}
