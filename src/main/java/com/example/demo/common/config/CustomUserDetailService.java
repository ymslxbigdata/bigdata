package com.example.demo.common.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.example.demo.entity.UserAuthUserInfo;
import com.example.demo.service.UserManageService;

@Component
public class CustomUserDetailService implements UserDetailsService{
    @Autowired
    private UserManageService userManageService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("CustomUserDetailService.loadUserByUsername()");

        if (StringUtils.isEmpty(username)) {
            throw new UsernameNotFoundException(
                    "recieved username is blank, couldn't retrieve user informartion");
        }

//      UserInfo userInfo = userInfoRepository.findByUserName(token.getName());
        // 调用A1-plugins获取当前用户的用户信息
        List<UserAuthUserInfo> usrAuthUserInfos= userManageService.findUserAuthByCode(username);
      
        if (usrAuthUserInfos.isEmpty() || usrAuthUserInfos.get(0) == null) {
        	throw new UsernameNotFoundException(
                  "the user is not exist");
		}

        UserAuthUserInfo userInfo = usrAuthUserInfos.get(0);
        
        //定义权限列表.
        List<GrantedAuthority> authorities = new ArrayList<>();
        // 用户可以访问的资源名称（或者说用户所拥有的权限） 注意：必须"ROLE_"开头
//        authorities.add(new SimpleGrantedAuthority("ROLE_"+userInfo.getRole().name()));
        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

        User userDetails = new User(userInfo.getUserCode(),userInfo.getPassword(),authorities);
        return userDetails;
    }

}