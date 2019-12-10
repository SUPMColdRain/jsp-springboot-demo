package com.jsp.exam.service;

import com.jsp.exam.dao.UserDao;
import com.jsp.exam.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        userDao.add(user.getId(), user.getUserPwd());
    }

    @Override
    public void deleteUser(Integer id) {
        userDao.deleteById(id);
    }

    @Override
    public void updateUser(User user) {
        userDao.save(user);
    }

    @Override
    public User findUser(Integer id) {
        return userDao.findById(id).get();
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAll();
    }

}
