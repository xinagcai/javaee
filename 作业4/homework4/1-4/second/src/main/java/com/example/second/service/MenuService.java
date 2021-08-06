package com.example.second.service;

import com.example.second.entity.Menu;

import java.util.List;

public interface MenuService {

    public List<Menu> getAllMenusWithRole();

    List<Menu> getMenusByUserId(Integer id);
}
