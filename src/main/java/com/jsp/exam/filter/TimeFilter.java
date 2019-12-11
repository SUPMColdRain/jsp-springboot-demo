package com.jsp.exam.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import java.io.IOException;

public class TimeFilter implements Filter {

    private final Logger logger = LoggerFactory.getLogger(TimeFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("--- Global filter init ---");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("--- Global Filter Start ---");
        logger.info("doFilter");
        long start = System.currentTimeMillis();
        chain.doFilter(request, response);
        System.out.println("执行了:" + (System.currentTimeMillis() - start) + "毫秒");
        System.out.println("--- Global Filter Finish ---");
        System.out.println();
    }

    @Override
    public void destroy() {
        System.out.println("--- Global Filter Destroy");
    }
}
