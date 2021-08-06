package com.example.second.dao.impl;

import com.example.second.dao.StudentDao;
import com.example.second.dao.TeacherDao;
import com.example.second.entity.Teacher;
import com.example.second.store.Store;
import com.example.second.store.StoreTeacher;
import org.springframework.stereotype.Component;

import java.util.List;


@Component(value = "TeacherDao")
public class TeacherDaoBean implements TeacherDao {

    public List<Teacher> getAllTeachers() {
        return StoreTeacher.findAllTeachers();
    }
     public void addTeacher(Teacher teacher) {
         StoreTeacher.addTeacher(teacher);
     }
    public void deleteTeacherById(Long uid) {
        StoreTeacher.deleteTeacherById(uid);
    }
    public void editTeacherById(Teacher teacher) {
        StoreTeacher.editTeacherById(teacher);
    }
}
