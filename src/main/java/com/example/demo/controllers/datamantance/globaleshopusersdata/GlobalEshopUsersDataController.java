package com.example.demo.controllers.datamantance.globaleshopusersdata;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.GlobalEshopInfo;
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
	
	//新增或修改全球跨境电商用户数据
	@RequestMapping(value="newOrModifyEshopUserData"
	              , method = RequestMethod.POST
	              , consumes = MediaType.APPLICATION_JSON_VALUE
	              , produces = MediaType.APPLICATION_JSON_VALUE
	               )
	@ResponseBody
	public void newOrModifyEshopUserData(@RequestBody final GlobalEshopUsersData para) {

		globalEshopUsersDataService.newOrModifyEshopUserData(para);
	}
	
	//获取全球跨境电商用户详细数据
	@RequestMapping(value="getGlobalEshopUserDataDetail"
	              , method = RequestMethod.POST
	              , consumes = MediaType.APPLICATION_JSON_VALUE
	              , produces = MediaType.APPLICATION_JSON_VALUE
	               )
	@ResponseBody
	public Optional<GlobalEshopUsersData> getGlobalEshopUserDataDetail(@RequestBody final GlobalEshopUsersData para) {

		return globalEshopUsersDataService.getGlobalEshopUserDataDetail(para);
	}
	
	//删除全球跨境电商用户数据
	@RequestMapping(value="deleteEshopUsersData"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public void deleteEshopUsersData(@RequestBody final GlobalEshopInfo globalEshopInfo) {
		globalEshopUsersDataService.deleteEshopUsersData(globalEshopInfo.getEshopId());
	}
}
