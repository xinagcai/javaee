package com.example.second.service.impl;


import com.example.second.dao.StudentCountDao;
import com.example.second.entity.StudentCount;
import com.example.second.service.StudentCountService;
import org.springframework.stereotype.Service;

@Service
public class StudentCountServiceBean implements StudentCountService {
    public void addCount(StudentCount studentCount) {
        Integer count = studentCount.getCount();

    }

    public void reduceCount(StudentCount studentCount) {
        Integer count = studentCount.getCount();

    }
}
