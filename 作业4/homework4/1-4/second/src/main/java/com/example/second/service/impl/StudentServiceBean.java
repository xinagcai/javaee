package com.example.second.service.impl;

import com.example.second.dao.StudentCopyDao;
import com.example.second.dao.StudentCountDao;
import com.example.second.dao.StudentDao;
import com.example.second.entity.Student;
import com.example.second.entity.StudentCount;
import com.example.second.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
//@Transactional(rollbackFor = Exception.class)
public class StudentServiceBean implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private StudentCountDao studentCountDao;

    @Autowired
    StudentCopyDao studentCopyDao;

    public List<Student> findAllStudents() {
        return this.studentDao.findAllStudents();
    }


    @Transactional
    public void addStudent(Student student) {
        this.studentDao.addStudent(student);
//        this.studentCopyDao.addStudent(student);
        Integer count = this.studentDao.getCountStudents();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
        int x = 5 / 0;
        this.studentCountDao.addCount(count);
    }

    public void deleteStudentById(Long uid) {
        this.studentDao.deleteStudentById(uid);
        Integer count = this.studentDao.getCountStudents();
        this.studentCountDao.addCount(count);
    }

    public void updateStudent(Student student) {
        this.studentDao.updateStudent(student);
    }

    public List<Student> findStudentByName(String name) {
        return this.studentDao.findStudentByName(name);
    }

    public Integer deleteStudentsByIds(Integer[] ids) {
        return this.studentDao.deleteStudentsByIds(ids);
    }

}
