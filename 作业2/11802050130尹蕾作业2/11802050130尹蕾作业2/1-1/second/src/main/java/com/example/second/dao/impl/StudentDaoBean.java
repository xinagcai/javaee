package com.example.second.dao.impl;

import com.example.second.dao.StudentDao;
import com.example.second.entity.Student;
import com.example.second.store.Store;
import org.springframework.stereotype.Component;

import java.util.List;


@Component(value = "StudentDao")
public class StudentDaoBean implements StudentDao {

    public List<Student> getAllStudents() {
        return Store.findAllStudents();
    }
     public void addStudent(Student student) {
        Store.addStudent(student);
     }
    public void deleteStudentById(Long uid) {
        Store.deleteStudentById(uid);
    }
    public void editStudentById(Student student) {
        Store.editStudentById(student);
    }
}
