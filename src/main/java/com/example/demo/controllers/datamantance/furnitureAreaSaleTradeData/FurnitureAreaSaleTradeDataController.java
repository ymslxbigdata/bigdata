package com.example.demo.controllers.datamantance.furnitureAreaSaleTradeData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.FurnitureAreaSaleTradeData;
import com.example.demo.service.dataMantance.furnitureAreaSaleTradeData.FurnitureAreaSaleTradeDataService;

@Controller
@RequestMapping("dataMantance/furnitureAreaSaleTradeData")
public class FurnitureAreaSaleTradeDataController {
	

	@Autowired
	FurnitureAreaSaleTradeDataService furnitureAreaSaleTradeDataService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
        return "dataMantance/furnitureAreaSaleTradeData/furnitureAreaSaleTradeData"; 
	}
    
    //获取各地区家具交易数据
    @RequestMapping(value="getFurnitureAreaSaleTradeData"
                  , method = RequestMethod.POST
                  , consumes = MediaType.APPLICATION_JSON_VALUE
                  , produces = MediaType.APPLICATION_JSON_VALUE
                  )
    @ResponseBody
    public List<FurnitureAreaSaleTradeData> getFurnitureAreaSaleTradeData(@RequestBody final FurnitureAreaSaleTradeData para) {
        	
    	return furnitureAreaSaleTradeDataService.getFurnitureAreaSaleTradeData(para);
    }
    
    //追加修改保存
    @RequestMapping(value="saveData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
            )
    @ResponseBody
    public void saveData(@RequestBody final FurnitureAreaSaleTradeData para) {
  	
    	furnitureAreaSaleTradeDataService.saveData(para);
    }
    
    //追加修改保存
    @RequestMapping(value="deleteData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
            )
    @ResponseBody
    public void deleteData(@RequestBody final FurnitureAreaSaleTradeData para) {
  	
    	furnitureAreaSaleTradeDataService.deleteData(para);;
    }
}
