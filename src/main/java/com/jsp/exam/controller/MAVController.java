package com.jsp.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// @RestController注解集成了@ResponseBody注解,无需再在每个方法前添加
// @Controller注解默认会返回到视图页面,如: index.jsp
// @RestController注解默认会返回JSON格式数据
@Controller
public class MAVController {

    @RequestMapping(path = "/")
    public ModelAndView homePage(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        System.out.println(">>> Into Index Page");
        return mav;
    }

    @RequestMapping(path = "/signup")
    public ModelAndView signUp(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("signUp");
        System.out.println(">>> Into Sign Up Page");
        return mav;
    }

    @RequestMapping(path = "/signin")
    public ModelAndView signIn(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("signIn");
        System.out.println(">>> Into Sign In Page");
        return mav;
    }
}
