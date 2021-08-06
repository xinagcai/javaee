package com.example.demo.module1.controller;

import com.example.demo.module1.entity.Student;
import com.example.demo.module1.service.StudentServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@ResponseBody
@RequestMapping("/student")
public class controller {

    @GetMapping("/studentList")
    public List<Object> findAll(){
        List<Object> students= new StudentServiceImpl().findAll();
        return students;
    }

    @PostMapping("/add")
    public String add(Student student){
        StudentServiceImpl studentService = new StudentServiceImpl();
        return studentService.add(student);
    }

    @GetMapping("/delete")
    public String delete(Student student){
        return new StudentServiceImpl().delete(student);
    }

    @GetMapping("/deleteById")
    public String delete(int id){
        return new StudentServiceImpl().delete(id);
    }

    @PostMapping("/update")
    public String update(Student student){
        return new StudentServiceImpl().update(student);
    }

    @GetMapping("/findStudent")
    public Object find(int id){
        Object student= new StudentServiceImpl().findById(id);
        return student;
    }


}
