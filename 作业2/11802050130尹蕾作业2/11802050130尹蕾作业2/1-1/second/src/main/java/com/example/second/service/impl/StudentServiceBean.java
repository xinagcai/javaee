package com.example.second.service.impl;

import com.example.second.dao.StudentDao;
import com.example.second.entity.Student;
import com.example.second.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class StudentServiceBean implements StudentService {

    @Autowired
    private StudentDao studentDao;

    public List<Student> getAllStudents() {
        return this.studentDao.getAllStudents();
    }

    public void addStudent(Student student) {
        this.studentDao.addStudent(student);
    }

    public void deleteStudentById(Long uid){
        this.studentDao.deleteStudentById(uid);
    }

    public void editStudentById(Student student){
        this.studentDao.editStudentById(student);
    }
}
