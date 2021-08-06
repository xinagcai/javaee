package com.example.second.controller;


import com.example.second.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Transactional
@RestController
@RequestMapping("/first")
@CrossOrigin(allowCredentials = "true")
public class TeacherController {

    @Autowired
    private com.example.second.service.TeacherService TeacherService;

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }

    /**
     * 查询所有学生
     */
    @GetMapping("/findAllTeachers")
    public List<Teacher> findAllTeachers() {
        return this.TeacherService.findAllTeachers();
    }

    /**
     * 增加学生
     */
    @PostMapping("/addTeacher")
    public void addTeacher(@RequestBody Teacher teacher) {
        this.TeacherService.addTeacher(teacher);
    }

    /**
     * 根据学生id删除学生
     */
    @PostMapping("/deleteTeacher")
    public void deleteTeacherById(@RequestParam Long uid) {
        this.TeacherService.deleteTeacherById(uid);
    }

    /**
     * 编辑学生
     */
    @PostMapping("/updateTeacher")
    public void updateTeacher(@RequestBody Teacher teacher) {
        this.TeacherService.updateTeacher(teacher);
    }

    /**
     * 根据学生姓名查找学生
     */
    @GetMapping("/findTeacherByName")
    public List<Teacher> findTeacherByName(@RequestParam String name) {
        return this.TeacherService.findTeacherByName(name);
    }

    /**
     * 批量删除学生
     */
    @PostMapping("/deleteTeachersByIds")
    public Integer deleteTeachersByIds(Integer[] ids) {
        return this.TeacherService.deleteTeachersByIds(ids);
    }

    /**
     * 批量删除学生
     */
    @PostMapping("/updateFileByPrimaryKey")
    public Integer updateFileByPrimaryKey(@RequestBody Teacher teacher) {
        return this.TeacherService.updateFileByPrimaryKey(teacher);
    }


}
