package com.cqut.ktp.service.impl;

import com.cqut.ktp.mapper.SchoolMapper;
import com.cqut.ktp.entity.School;
import com.cqut.ktp.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    private SchoolMapper mapper;

    @Override
    public List<School> selectSchool() {
        return mapper.selectSchool();
    }
}
