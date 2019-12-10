package com.jsp.exam.service;

import com.jsp.exam.entity.User;

import java.util.List;

public interface UserService {

    void addUser(User user);
    void deleteUser(Integer id);
    void updateUser(User user);
    User findUser(Integer id);
    List<User> findAllUser();
}
