package com.example.second.dao;


import com.example.second.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component(value = "StudentCopyDao")
public interface StudentCopyDao {

    int addStudent(Student studentCopy);

}
