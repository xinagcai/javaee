package com.example.second.dao;


import com.example.second.entity.TeacherFile;
import com.example.second.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component(value = "UploadDao")
public interface UploadDao {
    void insertFile(TeacherFile teacherFile);
    List<TeacherFile> findAllFiles(User user);
    TeacherFile findById(Integer id);

}
