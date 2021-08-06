package com.example.second.controller;


import com.example.second.entity.Teacher;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/first")
@CrossOrigin(allowCredentials = "true")
public class TeacherController {

    @Autowired
    private TeacherService TeacherService;

    @GetMapping("/findAllTeachers")
    public List<Teacher> getAllTeachers() {
        return this.TeacherService.getAllTeachers();
    }

    @PostMapping("/addTeacher")
    public void addTeacher(@RequestBody Teacher teacher) {
        this.TeacherService.addTeacher(teacher);
    }

    @PostMapping(value = "/deleteTeacher")
    public void deleteTeacherById(@RequestParam Long uid) {
        this.TeacherService.deleteTeacherById(uid);
    }

    @PostMapping("/editTeacher")
    public void editTeacherById(@RequestBody Teacher teacher) {
        this.TeacherService.editTeacherById(teacher);
    }
}
