package com.jsp.exam.configuration;

import com.jsp.exam.filter.GlobalFilter;
import com.jsp.exam.interceptor.GlobalInterceptor;
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
    GlobalInterceptor globalInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        logger.info("add interceptors");
        registry.addInterceptor(new GlobalInterceptor())
                .excludePathPatterns(Arrays.asList("/favicon.ico", "/style/**"));
    }

    @Bean
    public FilterRegistrationBean globalFilter() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        GlobalFilter globalFilter = new GlobalFilter();

        registrationBean.setFilter(globalFilter);

        ArrayList<String> urls = new ArrayList<>();
        urls.add("/*");
        registrationBean.setUrlPatterns(urls);
        return registrationBean;
    }

}
