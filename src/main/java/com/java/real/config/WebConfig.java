package com.java.real.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.support.ErrorPageFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {

    @Bean
    public ErrorPageFilter errorPageFilter() {
        return new ErrorPageFilter();
    }

    @Bean
    public FilterRegistrationBean<ErrorPageFilter> disableErrorPageFilter(ErrorPageFilter filter) {
        FilterRegistrationBean<ErrorPageFilter> registration = new FilterRegistrationBean<>(filter);
        registration.setEnabled(false);   // disables duplicate registration
        return registration;
    }
}

