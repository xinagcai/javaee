package com.example.second.dao;


import com.example.second.entity.StudentCount;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component(value = "StudentCountDao")
public interface StudentCountDao {

    public void addCount(Integer count);

}
