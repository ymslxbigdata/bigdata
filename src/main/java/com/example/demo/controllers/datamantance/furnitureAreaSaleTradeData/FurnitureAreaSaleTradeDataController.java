package com.example.demo.controllers.datamantance.furnitureAreaSaleTradeData;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.beans.FileUtil;
import com.example.demo.entity.FurnitureAreaSaleTradeData;
import com.example.demo.entity.GlobalEshopOverseasRepo;
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
    
    @RequestMapping(value="export")
    @ResponseBody
    public void export(HttpServletResponse response){

    	FurnitureAreaSaleTradeData para = new FurnitureAreaSaleTradeData("");
    	List<FurnitureAreaSaleTradeData> tradeDataList = furnitureAreaSaleTradeDataService.getFurnitureAreaSaleTradeData(para);

        //导出操作
        FileUtil.exportExcel(tradeDataList,"全球家居交易数据","全球家居交易数据",FurnitureAreaSaleTradeData.class,"全球家居交易数据.xls",response);
    }

    @RequestMapping("importExcel")
    @ResponseBody
    public void importExcel(final MultipartFile file){

    	List<FurnitureAreaSaleTradeData> tradeDataList = FileUtil.importExcel(file,1,1,FurnitureAreaSaleTradeData.class);

        // 保存数据库
    	furnitureAreaSaleTradeDataService.batchSaveData(tradeDataList);
    }
}
