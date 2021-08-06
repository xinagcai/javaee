package com.cqut.ktp.controller;

import com.cqut.ktp.entity.School;
import com.cqut.ktp.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class SchoolController {
    @Autowired
    private SchoolService schoolService;

    @GetMapping(value = "/selectSchool")
    public List<School> selectSchool() {
        return schoolService.selectSchool();
    }
}
