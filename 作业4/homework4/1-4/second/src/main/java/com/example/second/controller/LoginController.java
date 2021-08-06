package com.example.second.controller;

import com.example.second.entity.Menu;
import com.example.second.entity.RespBean;
import com.example.second.entity.User;
import com.example.second.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
//import org.springframework.data.redis.core.StringRedisTemplate;
//import org.springframework.data.redis.core.ValueOperations;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Transactional
@RestController
public class LoginController {

    @Autowired
    MenuService menuService;
    @GetMapping("/login")
    public RespBean login(){
        return RespBean.error("尚未登录，请登录");
    }


    @GetMapping("/menu")
    public List<Menu> getMenusByUserId() {
        return this.menuService.getMenusByUserId(((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId());
    }


//    @Autowired
//    StringRedisTemplate stringRedisTemplate;

//    @GetMapping("/set")
//    public void set() {
//        ValueOperations<String,String> ops = stringRedisTemplate.opsForValue();
//        ops.set("name","javaboy");
//    }
//
//    @GetMapping("/get")
//    public void get() {
//        ValueOperations<String,String> ops = stringRedisTemplate.opsForValue();
//        ops.get("name");
//    }
}
