package com.example.demo.controllers.datamantance.globaleshopusersdata;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.GlobalEshopUsersData;
import com.example.demo.service.dataMantance.globalEshopUsersData.GlobalEshopUsersDataService;

@Controller
@RequestMapping("dataMantance/globalEshopUsersData")
public class GlobalEshopUsersDataController {

	@Autowired
	GlobalEshopUsersDataService globalEshopUsersDataService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
		return "dataMantance/globalEshopUsersData/globalEshopUsersData"; 
	}
	
	//获取全球跨境电商用户数据
	@RequestMapping(value="getGlobalEshopUsersData"
	              , method = RequestMethod.POST
	              , consumes = MediaType.APPLICATION_JSON_VALUE
	              , produces = MediaType.APPLICATION_JSON_VALUE
	               )
	@ResponseBody
	public List<GlobalEshopUsersData> getGlobalEshopUsersData(@RequestBody final GlobalEshopUsersData para) {
	        	
		return globalEshopUsersDataService.getGlobalEshopUsersData(para);
	}	  
	  
}
