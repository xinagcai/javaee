package com.example.second.service;

import com.example.second.entity.Teacher;

import java.util.List;


public interface TeacherService {

     public List<Teacher> getAllTeachers();

     public void addTeacher(Teacher teacher);

     public void deleteTeacherById(Long uid);

     public void editTeacherById(Teacher teacher);
}
