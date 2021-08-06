package com.example.second.dao;


import com.example.second.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component(value = "MenuDao")
public interface MenuDao {

    List<Menu> getAllMenusWithRole();

    List<Menu> getMenusByUserId(Integer id);
}
