package com.example.second.service;

import com.example.second.entity.Student;
import org.springframework.stereotype.Service;

import java.util.List;



public interface StudentService {

     public List<Student> getAllStudents();

     public void addStudent(Student student);

     public void deleteStudentById(Long uid);

     public void editStudentById(Student student);
}
