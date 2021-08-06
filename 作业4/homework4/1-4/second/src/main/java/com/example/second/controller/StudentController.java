package com.example.second.controller;


import com.example.second.entity.Student;
import com.example.second.service.MenuService;
import com.example.second.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Transactional
@RestController
@RequestMapping("/student")
@CrossOrigin(allowCredentials = "true")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有学生
     */
    @GetMapping("/findAllStudents")
    public List<Student> findAllStudents() {
        return this.studentService.findAllStudents();
    }

    /**
     * 增加学生
     */
    @PostMapping("/addStudent")
    public void addStudent(@RequestBody Student student) {
        this.studentService.addStudent(student);
    }

    /**
     * 根据学生id删除学生
     */
    @PostMapping("/deleteStudent")
    public void deleteStudentById(@RequestParam Long uid) {
        this.studentService.deleteStudentById(uid);
    }

    /**
     * 编辑学生
     */
    @PostMapping("/updateStudent")
    public void updateStudent(@RequestBody Student student) {
        this.studentService.updateStudent(student);
    }

    /**
     * 根据学生姓名查找学生
     */
    @GetMapping("/findStudentByName")
    public List<Student> findStudentByName(@RequestParam String name) {
        return this.studentService.findStudentByName(name);
    }

    /**
     * 批量删除学生
     */
    @PostMapping("/deleteStudentsByIds")
    public Integer deleteStudentsByIds(Integer[] ids) {
        return this.studentService.deleteStudentsByIds(ids);
    }
}
