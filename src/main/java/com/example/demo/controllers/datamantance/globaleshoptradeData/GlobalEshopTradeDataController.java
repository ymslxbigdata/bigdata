package com.example.demo.controllers.datamantance.globaleshoptradeData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.entity.GlobalEshopTradeData;
import com.example.demo.service.dataMantance.globalEshopTradeData.GlobalEshopTradeDataService;

@Controller
@RequestMapping("dataMantance/globalEshopTradeData")
public class GlobalEshopTradeDataController {
	

	@Autowired
	GlobalEshopTradeDataService globalEshopTradeDataService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
        return "dataMantance/globalEshopTradeData/globalEshopTradeData"; 
	}
	
	//获取电商平台
    @RequestMapping(value="getEshopOptions"
                  , method = RequestMethod.POST
                  , consumes = MediaType.APPLICATION_JSON_VALUE
                  , produces = MediaType.APPLICATION_JSON_VALUE
                  )
    @ResponseBody
    public List<GlobalEshopInfo> getEshopOptions() {
        	
    	return globalEshopTradeDataService.getEshopOptions();
    }
    
    //获取全球跨境电商交易数据
    @RequestMapping(value="getGlobalEshopTradeData"
                  , method = RequestMethod.POST
                  , consumes = MediaType.APPLICATION_JSON_VALUE
                  , produces = MediaType.APPLICATION_JSON_VALUE
                  )
    @ResponseBody
    public List<GlobalEshopTradeData> getGlobalEshopTradeData(@RequestBody final GlobalEshopTradeData para) {
        	
    	return globalEshopTradeDataService.getGlobalEshopTradeData(para);
    }
    
    //追加删除保存
    @RequestMapping(value="saveData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
            )
    @ResponseBody
    public void saveData(@RequestBody final GlobalEshopTradeData para) {
  	
        globalEshopTradeDataService.saveData(para);
    }
}
