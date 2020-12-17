package com.demo.dao;

import com.demo.entity.User;

public interface UserDao {
    public boolean addUser(User user);
    public boolean checkLogin(String username, String password);
}
