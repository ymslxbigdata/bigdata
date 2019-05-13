package com.example.demo.controllers.datamantance.furnitureHotSaleProductData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.FurnitureHotSaleProductData;
import com.example.demo.service.dataMantance.furnitureHotSaleProductData.FurnitureHotSaleProductDataService;

@Controller
@RequestMapping("dataMantance/furnitureHotSaleProductData")
public class FurnitureHotSaleProductDataController {
	

	@Autowired
	FurnitureHotSaleProductDataService furnitureHotSaleProductDataService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
        return "dataMantance/furnitureHotSaleProductData/furnitureHotSaleProductData"; 
	}
    
    //获取热销品牌数据
    @RequestMapping(value="getFurnitureHotSaleProductData"
                  , method = RequestMethod.POST
                  , consumes = MediaType.APPLICATION_JSON_VALUE
                  , produces = MediaType.APPLICATION_JSON_VALUE
                  )
    @ResponseBody
    public List<FurnitureHotSaleProductData> getFurnitureHotSaleProductData(@RequestBody final FurnitureHotSaleProductData para) {
        	
    	return furnitureHotSaleProductDataService.getFurnitureHotSaleProductData(para);
    }
    
    //追加修改保存
    @RequestMapping(value="saveData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
            )
    @ResponseBody
    public void saveData(@RequestBody final FurnitureHotSaleProductData para) {
  	
    	furnitureHotSaleProductDataService.saveData(para);
    }
    
    //删除保存
    @RequestMapping(value="deleteData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
            )
    @ResponseBody
    public void deleteData(@RequestBody final FurnitureHotSaleProductData para) {
  	
    	furnitureHotSaleProductDataService.deleteData(para);;
    }
}
