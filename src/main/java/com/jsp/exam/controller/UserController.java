package com.jsp.exam.controller;

import com.jsp.exam.entity.User;
import com.jsp.exam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
//@Controller
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list")
    public List<User> findAllUser() {
        return userService.findAllUser();
    }

    @GetMapping("/query/{id}")
    public User findUserRestful(@PathVariable("id") Integer id) {
        return userService.findUser(id);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteUserRestful(@PathVariable("id") Integer id) {
        userService.deleteUser(id);
    }

    @PostMapping("/add")
    public void addUserRestful(User user) {
        userService.addUser(user);
    }

    @PutMapping("/update")
    public void updateUserRestful(User user) {
        userService.updateUser(user);
    }
}
