package com.example.second.service;

import com.example.second.entity.Student;
import org.springframework.stereotype.Service;

import java.util.List;


public interface StudentService {

    public List<Student> findAllStudents();

    public void addStudent(Student student);

    public void deleteStudentById(Long uid);

    public void updateStudent(Student student);

    List<Student> findStudentByName(String name);

    public Integer deleteStudentsByIds(Integer[] ids);
}
