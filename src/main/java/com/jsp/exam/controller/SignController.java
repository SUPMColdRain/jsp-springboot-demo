package com.jsp.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignController {

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
