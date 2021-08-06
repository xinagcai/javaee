package com.example.second.dao;

import com.example.second.entity.Student;
import org.springframework.stereotype.Component;

import java.util.List;




public interface StudentDao {

    List<Student> getAllStudents();

    public void addStudent(Student student);

    public void deleteStudentById(Long uid);

    public void editStudentById(Student student);
}
