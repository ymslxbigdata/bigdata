package com.example.demo.service;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.entity.UserAuthUserInfo;
import com.example.demo.repository.UserManageRepository;

@Service
public class DataInit {

    @Autowired 
    private UserManageRepository userInfoRepository;

    @Autowired 
    private PasswordEncoder passwordEncoder;

    @PostConstruct
    public void dataInit() {

        UserAuthUserInfo admin = new UserAuthUserInfo();
        admin.setUserCode("admin");
        admin.setPassword(passwordEncoder.encode("123"));
        userInfoRepository.save(admin);

        UserAuthUserInfo user = new UserAuthUserInfo();
        user.setUserCode("user");
        user.setPassword(passwordEncoder.encode("123"));
        userInfoRepository.save(user);
    }

}
