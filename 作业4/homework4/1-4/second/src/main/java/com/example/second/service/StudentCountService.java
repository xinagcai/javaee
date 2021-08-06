package com.example.second.service;

import com.example.second.entity.StudentCount;

public interface StudentCountService {
    public void addCount(StudentCount studentCount);

    public void reduceCount(StudentCount studentCount);
}
