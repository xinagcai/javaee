package com.example.second.dao;

import com.example.second.entity.Teacher;

import java.util.List;


public interface TeacherDao {

    List<Teacher> getAllTeachers();

    public void addTeacher(Teacher teacher);

    public void deleteTeacherById(Long uid);

    public void editTeacherById(Teacher teacher);
}
