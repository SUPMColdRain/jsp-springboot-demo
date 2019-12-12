package com.jsp.exam.controller;

import com.jsp.exam.entity.User;
import com.jsp.exam.service.StudentService;
import com.jsp.exam.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// @RestController注解集成了@ResponseBody注解,无需再在每个方法前添加
// @Controller注解默认会返回到视图页面,如: index.jsp
// @RestController注解默认会返回JSON格式数据
@Controller
public class MAVController {

    private static final Logger logger = LoggerFactory.getLogger(MAVController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    @RequestMapping(path = "/")
    public ModelAndView homePage(HttpServletRequest request) {
        System.out.println(">>> Into Index Page");

        /**
         * 简陋的网站访问量统计
         */
        HttpSession session = request.getSession();
        int visitor = session.getAttribute("visitor") != null ? (int) session.getAttribute("visitor") : 0;
        System.out.println("网站访问量：" + visitor);
        session.setAttribute("visitor", visitor + 1);
        return new ModelAndView("index");
    }

    @RequestMapping(path = "/signup")
    public ModelAndView signUp() {
        System.out.println(">>> Into Sign Up Page");
        return new ModelAndView("signUp");
    }

    @RequestMapping(path = "/signin")
    public ModelAndView signIn() {
        System.out.println(">>> Into Sign In Page");
        return new ModelAndView("signIn");
    }

    @RequestMapping(path = "/login")
    public ModelAndView login(HttpServletRequest request) {

        HttpSession session = request.getSession(true);
        session.setAttribute("username", request.getParameter("username"));

        int id = Integer.parseInt(request.getParameter("username"));
        String userPwd = request.getParameter("password");

        if (userService.findUser(id) == null) {
            return new ModelAndView("forward:/signup");
        } else if (userService.findUser(id).getId() == id &&
                userService.findUser(id).getUserPwd().equals(userPwd)) {
            return new ModelAndView("forward:/");
        } else {
            return new ModelAndView("forward:/signin");
        }
    }

    @RequestMapping(path = "/register")
    public ModelAndView register(HttpServletRequest request) {

        HttpSession session = request.getSession(true);
        session.setAttribute("username", request.getParameter("username"));

        int id = Integer.parseInt(request.getParameter("username"));
        String userPwd = request.getParameter("password");

        System.out.println("studentService.findStudentOne(id)" + studentService.findStudentOne(id));
        if (studentService.findStudentOne(id) == null) {
            return new ModelAndView("forward:/signup");
        } else {
            User user = new User();
            user.setId(id);
            user.setUserPwd(userPwd);
            userService.addUser(user);
            return new ModelAndView("forward:/");
        }
    }

    @RequestMapping(path = "/logout")
    public ModelAndView logout() {
        return new ModelAndView("forward:/signin");
    }
}
