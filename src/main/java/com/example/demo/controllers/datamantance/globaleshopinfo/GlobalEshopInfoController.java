package com.example.demo.controllers.datamantance.globaleshopinfo;

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

import com.example.demo.entity.GlobalCountryInfo;
import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.service.dataMantance.GlobalEshopInfoService;

@Controller
@RequestMapping("dataMantance/globalEshopInfo")
public class GlobalEshopInfoController {

	@Autowired
	GlobalEshopInfoService globalEshopInfoService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
		return "dataMantance/globalEshopInfo/globalEshopInfo"; 
	}

	//获取电商平台所属国家选项
	@RequestMapping(value="getcountryNmOptions"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public List<GlobalCountryInfo> getcountryNmOptions() {
	        	
		return globalEshopInfoService.getcountryNmOptions();
	}
	
	//获取全球跨境电商平台信息
	@RequestMapping(value="getGlobalEshopInfo"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public List<GlobalEshopInfo> getGlobalEshopInfo(@RequestBody final GlobalEshopInfo globalEshopInfo) {
	        	
		return globalEshopInfoService.getGlobalEshopInfo(globalEshopInfo);
	}
	
	//根据电商ID获取全球跨境电商平台信息
	@RequestMapping(value="getGlobalEshopInfoDetail"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public Optional<GlobalEshopInfo> getGlobalEshopInfoDetail(@RequestBody final GlobalEshopInfo globalEshopInfo) {

		return globalEshopInfoService.getGlobalEshopInfoDetail(globalEshopInfo.getEshopId());
	}
	
	//新增或者修改全球跨境电商平台信息
	@RequestMapping(value="newOrModifyEshopInfo"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public void newOrModifyEshopInfo(@RequestBody final GlobalEshopInfo globalEshopInfo) {
		globalEshopInfoService.newOrModifyEshopInfo(globalEshopInfo);
	}
	
	//删除全球跨境电商平台信息
	@RequestMapping(value="deleteEshopInfo"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public void deleteEshopInfo(@RequestBody final GlobalEshopInfo globalEshopInfo) {
		globalEshopInfoService.deleteEshopInfo(globalEshopInfo.getEshopId());
	}
}
