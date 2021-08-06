package com.cqut.ktp.controller;

import com.cqut.ktp.entity.User;
import com.cqut.ktp.service.UserService;
import com.cqut.ktp.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.apache.commons.codec.binary.Base64;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping(value = "/verify")
    public Map<String,Object> userVerify(@RequestParam String account, @RequestParam String password, @RequestParam String func) {
        User user = userService.userVerify(account);
        Map<String,Object> map = new HashMap<>();

        if (user == null) {
            return map;
        }
        try {
            // MD5加密
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            password = Base64.encodeBase64String(md5.digest(password.getBytes("utf-8")));
            if(password.equals(user.getPassword())){
                Map<String, String> payload = new HashMap<>();
                payload.put("account", user.getAccount());
                payload.put("password", user.getPassword());
                String token = JWTUtils.getToken(payload);
                map.put("token", token);//响应token
                return map;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    @GetMapping(value = "/findOneEntity")
    public User findOneEntity(@RequestParam String account) {

        return userService.userVerify(account);
    }

    @GetMapping(value = "/findEntityByUid")
    public User findEntityByUid(@RequestParam String uid) {
        return userService.findEntityByUid(uid);
    }

    @GetMapping(value = "/userList")
    public List<User> selectUsers(@RequestParam String cno) {
        return userService.selectUsers(cno);
    }

    @PostMapping(value = "/register")
    public Map<String, Object> register(@RequestBody User user) {
        userService.register(user);
        Map<String, Object> map = new HashMap<>();

        try {
            User userDB = userService.userVerify(user.getAccount());
            Map<String, String> payload = new HashMap<>();
            payload.put("account", userDB.getAccount());
            payload.put("password", userDB.getPassword());
            String token = JWTUtils.getToken(payload);
            map.put("token", token);//响应token
            return map;
        } catch (Exception e) {
            e.printStackTrace();

        }
        return map;


    }

    @PutMapping(value = "/updateUserInfo")
    public void updateUserInfo(@RequestParam(value = "password", required = false) String password,
                               @RequestParam(value = "pid", required = false) Integer pid,
                               @RequestParam(value = "name", required = false) String name,
                               @RequestParam(value = "sclID", required = false) Integer sclID,
                               @RequestParam(value = "identifyId", required = false) String identifyNo,
                               @RequestParam String userId) {
        userService.updateUserInfo(password, pid, name, sclID, identifyNo, userId);
    }
}
