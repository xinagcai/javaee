package com.example.second.service;

import com.example.second.entity.User;

import java.util.List;

public interface UserService {

    List<User> findAllUsers();

    void deleteUserById(Integer id);

    void addUser(User user);

    void updateUser(User user);
}
