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
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        System.out.println(">>> Into Index Page");

        /**
         * 简陋的网站访问量统计
         */
        HttpSession session = request.getSession();
        int visitor = session.getAttribute("visitor") != null ? (int) session.getAttribute("visitor") : 0;
        System.out.println("网站访问量：" + visitor);
        session.setAttribute("visitor", visitor + 1);
        return mav;
    }

    @RequestMapping(path = "/signup")
    public ModelAndView signUp() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("signUp");
        System.out.println(">>> Into Sign Up Page");
        return mav;
    }

    @RequestMapping(path = "/signin")
    public ModelAndView signIn() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("signIn");
        System.out.println(">>> Into Sign In Page");
        return mav;
    }

    @RequestMapping(path = "/login")
    public ModelAndView login(HttpServletRequest request) {
        logger.info("请求登录获取token");
        ModelAndView mav = new ModelAndView();

        int id = Integer.parseInt(request.getParameter("username"));
        String userPwd = request.getParameter("password");

        if (userService.findUser(id) == null) {
            mav.setViewName("signUp");
        } else if (userService.findUser(id).getId() == id &&
                userService.findUser(id).getUserPwd().equals(userPwd)) {
            mav.setViewName("index");
        } else {
            mav.setViewName("signIn");
        }
        return mav;
    }

    @RequestMapping(path = "/register")
    public ModelAndView register(HttpServletRequest request) {
        logger.info("请求注册获取token");
        ModelAndView mav = new ModelAndView();

        int id = Integer.parseInt(request.getParameter("username"));
        String userPwd = request.getParameter("password");

        if (studentService.findStudentOne(id) == null) {
            mav.setViewName("signUp");
        } else {
            User user = new User();
            user.setId(id);
            user.setUserPwd(userPwd);
            userService.addUser(user);
            mav.setViewName("index");
        }
        return mav;
    }

    @RequestMapping(path = "/logout")
    public ModelAndView logout() {
        logger.info("请求登出清除token");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("signIn");
        return mav;
    }
}
