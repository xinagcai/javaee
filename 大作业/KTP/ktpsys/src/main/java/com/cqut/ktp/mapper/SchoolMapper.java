package com.cqut.ktp.mapper;

import com.cqut.ktp.entity.School;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface SchoolMapper {
    /**
     * 查询所有学校的信息
     *
     * @return
     */
    List<School> selectSchool();
}
