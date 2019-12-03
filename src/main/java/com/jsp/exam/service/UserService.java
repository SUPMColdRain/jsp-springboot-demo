package com.jsp.exam.service;

import com.jsp.exam.entity.User;

import java.util.List;

public interface UserService {

    public void addUser(User user);
    public void deleteUser(Integer id);
    public void updateUser(User user);
    public User findUser(Integer id);
    public List<User> findAllUser();
}
