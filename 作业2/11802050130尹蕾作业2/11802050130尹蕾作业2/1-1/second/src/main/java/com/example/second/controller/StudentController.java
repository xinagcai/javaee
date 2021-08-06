package com.example.second.controller;


import com.example.second.entity.Student;
import com.example.second.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/first")
@CrossOrigin(allowCredentials = "true")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/hello")
    public String hello() {
        return "hello world";
    }

    @GetMapping("/findAllStudents")
    public List<Student> getAllStudents() {
        return this.studentService.getAllStudents();
    }

    @PostMapping("/addStudent")
    public void addStudent(@RequestBody Student student) {
        this.studentService.addStudent(student);
    }

    @PostMapping(value = "/deleteStudent")
    public void deleteStudentById(@RequestParam Long uid) {
        this.studentService.deleteStudentById(uid);
    }

    @PostMapping("/editStudent")
    public void editStudentById(@RequestBody Student student) {
        this.studentService.editStudentById(student);
    }
}
