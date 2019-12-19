package com.jsp.exam.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class SignInterceptor extends HandlerInterceptorAdapter {

    private final Logger logger = LoggerFactory.getLogger(SignInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        logger.info(request.getRequestURI());
        System.out.println("preHandle");
        System.out.println(((HandlerMethod) handler).getBean().getClass().getName());
        System.out.println(((HandlerMethod) handler).getMethod().getName());
        request.setAttribute("startTime", System.currentTimeMillis());
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandler");
        Long startTime = (Long) request.getAttribute("startTime");
        System.out.println("执行时间为:\t" + (System.currentTimeMillis() - startTime) + "毫秒");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println("completion");
        logger.info(request.getRequestURI());
        Long startTime = (Long) request.getAttribute("startTime");
        System.out.println("执行完Interceptor时间为:\t" + (System.currentTimeMillis() - startTime) + "毫秒");
        super.afterCompletion(request, response, handler, ex);
    }
}
