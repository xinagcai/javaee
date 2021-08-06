package com.cqut.ktp.service;

import com.cqut.ktp.entity.School;

import java.util.List;


public interface SchoolService {
    /**
     * 查询所有学校的信息
     *
     * @return
     */
    List<School> selectSchool();
}