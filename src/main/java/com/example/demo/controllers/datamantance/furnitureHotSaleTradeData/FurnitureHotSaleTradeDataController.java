package com.example.demo.controllers.datamantance.furnitureHotSaleTradeData;

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

import com.example.demo.entity.FurnitureHotSaleTradeData;
import com.example.demo.entity.FurnitureTypesInfo;
import com.example.demo.service.FurnitureHotSaleTradeDataService;
import com.example.demo.service.FurnitureTypesInfoService;

@Controller
@RequestMapping("dataMantance/furnitureHotSaleTradeData")
public class FurnitureHotSaleTradeDataController {

	@Autowired
	FurnitureHotSaleTradeDataService furnitureHotSaleTradeDataService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
		return "dataMantance/furnitureHotSaleTradeData/furnitureHotSaleTradeData"; 
	}
	
	//获取家具热销种类交易数据
	@RequestMapping(value="getFurnitureHotSaleTradeData"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public List<FurnitureHotSaleTradeData> getFurnitureHotSaleTradeData(@RequestBody final FurnitureHotSaleTradeData furnitureHotSaleTradeData) {
	        	
		return furnitureHotSaleTradeDataService.getFurnitureHotSaleTradeData(furnitureHotSaleTradeData);
	}
	
	//根据热销ID获取家具热销种类交易数据
	@RequestMapping(value="getFurnitureHotSaleTradeDataDetail"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public Optional<FurnitureHotSaleTradeData> getFurnitureHotSaleTradeDataDetail(@RequestBody final FurnitureHotSaleTradeData furnitureHotSaleTradeData) {

		return furnitureHotSaleTradeDataService.getFurnitureHotSaleTradeDataDetail(furnitureHotSaleTradeData.getSaleTradeId());
	}
	
	//新增或者修改家具热销种类交易数据
	@RequestMapping(value="newOrModifyFurnitureHotSaleTradeData"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public void newOrModifyFurnitureHotSaleTradeData(@RequestBody final FurnitureHotSaleTradeData furnitureHotSaleTradeData) {
		furnitureHotSaleTradeDataService.newOrModifyFurnitureHotSaleTradeData(furnitureHotSaleTradeData);
	}
	
	//删除家具热销种类交易数据
	@RequestMapping(value="deleteFurnitureHotSaleTradeData"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public void deleteFurnitureHotSaleTradeData(@RequestBody final FurnitureHotSaleTradeData furnitureHotSaleTradeData) {
		furnitureHotSaleTradeDataService.deleteFurnitureHotSaleTradeData(furnitureHotSaleTradeData.getSaleTradeId());
	}
}
