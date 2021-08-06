package com.example.second.service.impl;

import com.example.second.dao.UserDao;
import com.example.second.entity.User;
import com.example.second.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserServiceBean implements UserService, UserDetailsService {

    @Autowired
    UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.loadUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("用户名不存在");
        }
        user.setRoles(userDao.getRolesById(user.getId()));
        return user;
    }


    public List<User> findAllUsers() {
        List<User> users = this.userDao.findAllUsers();
        for (int i = 0; i < users.size(); i++) {
            users.get(i).setPassword(null);
        }
        return users;
    }

    public void deleteUserById(Integer id) {
        this.userDao.deleteUserById(id);
    }

    public void addUser(User user){
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String password = user.getPassword();
        String newPassword = encoder.encode(password);
        user.setPassword(newPassword);
        this.userDao.addUser(user);
    }

    public void updateUser(User user){
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String password= user.getPassword();
        String newPassword = encoder.encode(password);
        user.setPassword(newPassword);
        this.userDao.updateByPrimaryKeySelective(user);
    }
}
