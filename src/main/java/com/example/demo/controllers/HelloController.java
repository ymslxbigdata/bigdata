package com.example.demo.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.beans.FileUtil;
import com.example.demo.beans.Person;
import com.example.demo.service.UserManageService;

@RestController
@RequestMapping("/hello")
public class HelloController {

	@Autowired
	UserManageService userManageService;
	@Autowired
	FileUtil fileUtil;
	
    @GetMapping
    public String getWelcomeMsg() {
    	
    	// 获取登录信息--用户名、权限等
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return "Hello,Spring Security";
    }


    @GetMapping("/helloAdmin")
    @PreAuthorize("hasAnyRole('admin')")
    public String helloAdmin() {       
        return "Hello,admin";
    }

    @GetMapping("/helloUser")
    @PreAuthorize("hasAnyRole('admin','normal')")    
    public String helloUser() {       
        return "Hello,user";
    }
    
    @RequestMapping("export")
    public void export(HttpServletResponse response){

        //模拟从数据库获取需要导出的数据
        List<Person> personList = new ArrayList<>();
        Person person1 = new Person("路飞","1",new Date());
        Person person2 = new Person("娜美","2", new Date());
        Person person3 = new Person("索隆","1", new Date());
        Person person4 = new Person("小狸猫","1", new Date());
        personList.add(person1);
        personList.add(person2);
        personList.add(person3);
        personList.add(person4);

        //导出操作
        FileUtil.exportExcel(personList,"花名册","草帽一伙",Person.class,"海贼王.xls",response);
    }
    
    @RequestMapping("importExcel")
    public String importExcel(final MultipartFile file){
        String fileName = file.getOriginalFilename();
        String prefix = fileName.substring(fileName.lastIndexOf("."));
//        String filePath = "F:\\海贼王.xls";
        //解析excel，
        List<Person> personList = fileUtil.importExcel(file,1,1,Person.class);
        //也可以使用MultipartFile,使用 FileUtil.importExcel(MultipartFile file, Integer titleRows, Integer headerRows, Class<T> pojoClass)导入
        System.out.println("导入数据一共【"+personList.size()+"】行");

        //TODO 保存数据库
        
        return "保存成功";
    }

}