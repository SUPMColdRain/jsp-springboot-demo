package com.jsp.exam.configuration;

import com.jsp.exam.filter.TimeFilter;
import com.jsp.exam.interceptor.SignInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.Arrays;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

    private final Logger logger = LoggerFactory.getLogger(WebMvcConfiguration.class);

    @Autowired
    SignInterceptor signInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        logger.info("add interceptors");
        registry.addInterceptor(new SignInterceptor())
                .excludePathPatterns(Arrays.asList("/favicon.ico", "/style/**", "/selfie.jpg", "/avatar.png"));
    }

    @Bean
    public FilterRegistrationBean globalFilter() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        TimeFilter timeFilter = new TimeFilter();

        registrationBean.setFilter(timeFilter);

        ArrayList<String> urls = new ArrayList<>();
        urls.add("/*");
        registrationBean.setUrlPatterns(urls);
        return registrationBean;
    }

}
