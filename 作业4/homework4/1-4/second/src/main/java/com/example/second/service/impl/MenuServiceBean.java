package com.example.second.service.impl;


import com.example.second.dao.MenuDao;
import com.example.second.entity.Menu;
import com.example.second.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceBean implements MenuService {

    @Autowired
    MenuDao menuDao;

    @Override
    public List<Menu> getAllMenusWithRole() {
        return this.menuDao.getAllMenusWithRole();
    }


    @Override
    public List<Menu> getMenusByUserId(Integer id) {
        return this.menuDao.getMenusByUserId(id);
    }
}
