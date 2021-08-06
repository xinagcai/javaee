package com.example.demo.module1.dao;

import com.example.demo.module1.entity.Student;

import java.util.List;

public interface StudentDao {
    public List<Object> findAll() ;
    public Object findById(int id);
    public Student add(Student student) ;
    public void update(Student student);
    public void delete(Student student);
    public void delete(int id);


}
