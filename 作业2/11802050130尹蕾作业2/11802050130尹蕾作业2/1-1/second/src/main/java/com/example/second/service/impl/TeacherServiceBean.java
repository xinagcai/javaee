package com.example.second.service.impl;

import com.example.second.dao.TeacherDao;
import com.example.second.entity.Teacher;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TeacherServiceBean implements TeacherService {

    @Autowired
    private TeacherDao TeacherDao;

    public List<Teacher> getAllTeachers() {
        return this.TeacherDao.getAllTeachers();
    }

    public void addTeacher(Teacher teacher) {
        this.TeacherDao.addTeacher(teacher);
    }

    public void deleteTeacherById(Long uid){
        this.TeacherDao.deleteTeacherById(uid);
    }

    public void editTeacherById(Teacher teacher){
        this.TeacherDao.editTeacherById(teacher);
    }
}
