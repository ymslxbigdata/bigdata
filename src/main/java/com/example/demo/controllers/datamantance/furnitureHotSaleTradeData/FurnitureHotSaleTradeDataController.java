package com.example.demo.controllers.datamantance.furnitureHotSaleTradeData;

import java.util.List;
import java.util.Optional;

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
import com.example.demo.entity.FurnitureHotSaleTradeData;
import com.example.demo.entity.FurnitureTypesInfo;
import com.example.demo.entity.GlobalEshopOverseasRepo;
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
	
    @RequestMapping(value="export")
    @ResponseBody
    public void export(HttpServletResponse response){

    	FurnitureHotSaleTradeData para = new FurnitureHotSaleTradeData("","","");
    	para.setProductNm("");
    	List<FurnitureHotSaleTradeData> tradeDataList = furnitureHotSaleTradeDataService.getFurnitureHotSaleTradeData(para);

        //导出操作
        FileUtil.exportExcel(tradeDataList,"家居热销产品交易数据","家居热销产品交易数据",FurnitureHotSaleTradeData.class,"家居热销产品交易数据.xls",response);
    }
    
    @RequestMapping("importExcel")
    @ResponseBody
    public void importExcel(final MultipartFile file){

    	List<FurnitureHotSaleTradeData> tradeDataList = FileUtil.importExcel(file,1,1,FurnitureHotSaleTradeData.class);

        // 保存数据库
    	furnitureHotSaleTradeDataService.batchSaveData(tradeDataList);
    }
}
