package com.example.demo.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private static final String LOGIN_URL = "/login";
    
    @Bean  
    public PasswordEncoder passwordEncoder() {  
        return new BCryptPasswordEncoder();  
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {  
    http.authorizeRequests() // 定义哪些URL需要被保护、哪些不需要被保护
        .antMatchers("/global/**", "/resources/**","/public/**","/homepage","/dashboard", LOGIN_URL).permitAll()// 设置所有人都可以访问登录页面
        .anyRequest().authenticated()  // 任何请求,登录后可以访问
        .and()
        .formLogin().loginPage(LOGIN_URL)
        .defaultSuccessUrl("/homepage", true)
        .failureUrl(LOGIN_URL + "?error").permitAll();
    }
}