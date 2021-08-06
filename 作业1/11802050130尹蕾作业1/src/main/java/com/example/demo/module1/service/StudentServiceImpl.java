package com.example.demo.module1.service;

import com.example.demo.module1.dao.Store;
import com.example.demo.module1.dao.StudentDao;
import com.example.demo.module1.entity.Student;


import java.util.List;

public class StudentServiceImpl implements StudentService {
    @Override
    public List<Object> findAll() {
        StudentDao dao = new Store();
        return dao.findAll();
    }

    @Override
    public Object findById(int id) {
        StudentDao dao = new Store();
        return dao.findById(id);
    }

    @Override
    public String add(Student student) {
        StudentDao dao = new Store();
        Object student1 = dao.findById(student.getId());
        if(student1!=null){
            return "error,student existed";
        }

        dao.add(student);
        return "success";
    }

    @Override
    public String update(Student student) {
        StudentDao dao = new Store();
        Object student1 = dao.findById(student.getId());
        if(student1 ==null){
            return "error,student doesn't exist";
        }
        dao.update(student);

        return "success";
    }

    @Override
    public String delete(Student student) {
        StudentDao dao = new Store();
        Object student1= dao.findById(student.getId());
        if(student1==null){
            return "error,student doesn't exist";
        }
        dao.delete(student);
        return "success";
    }

    @Override
    public String delete(int id) {
        StudentDao dao = new Store();
        Object student1= dao.findById(id);
        if(student1==null){
            return "error,student doesn't exist";
        }
        dao.delete(id);
        return "success";
    }
}
