package com.example.demo.controllers.datamantance.furnitureTypesInfo;

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
import com.example.demo.entity.FurnitureTypesInfo;
import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.entity.GlobalEshopOverseasRepo;
import com.example.demo.entity.GlobalEshopTradeData;
import com.example.demo.service.FurnitureTypesInfoService;
import com.example.demo.service.dataMantance.GlobalEshopInfoService;

@Controller
@RequestMapping("dataMantance/furnitureTypesInfo")
public class FurnitureTypesInfoController {

	@Autowired
	FurnitureTypesInfoService furnitureTypesInfoService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
		return "dataMantance/furnitureTypesInfo/furnitureTypesInfo"; 
	}

	// 获取家具种类下拉框选项
	@RequestMapping(value="getTypeNmOptions"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public List<FurnitureTypesInfo> getTypeNmOptions() {

		return furnitureTypesInfoService.getTypeNmOptions();
	}
	
	//获取家具种类信息
	@RequestMapping(value="getFurnitureTypesInfoData"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public List<FurnitureTypesInfo> getFurnitureTypesInfoData(@RequestBody final FurnitureTypesInfo furnitureTypesInfo) {
	        	
		return furnitureTypesInfoService.getFurnitureTypesInfoData(furnitureTypesInfo);
	}
	
	//根据种类ID家具种类信息
	@RequestMapping(value="getFurnitureTypesDetail"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public Optional<FurnitureTypesInfo> getFurnitureTypesDetail(@RequestBody final FurnitureTypesInfo furnitureTypesInfo) {

		return furnitureTypesInfoService.getFurnitureTypesDetail(furnitureTypesInfo.getTypeId());
	}
	
	//新增或者修改家具种类信息
	@RequestMapping(value="newOrModifyFurnitureType"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public void newOrModifyFurnitureType(@RequestBody final FurnitureTypesInfo furnitureTypesInfo) {
		furnitureTypesInfoService.newOrModifyFurnitureType(furnitureTypesInfo);
	}
	
	//删除家具种类信息
	@RequestMapping(value="deleteFurnitureTypes"
	                  , method = RequestMethod.POST
	                  , consumes = MediaType.APPLICATION_JSON_VALUE
	                  , produces = MediaType.APPLICATION_JSON_VALUE
	                  )
	@ResponseBody
	public void deleteFurnitureTypes(@RequestBody final FurnitureTypesInfo furnitureTypesInfo) {
		furnitureTypesInfoService.deleteFurnitureTypes(furnitureTypesInfo.getTypeId());
	}
	
    @RequestMapping(value="export")
    @ResponseBody
    public void export(HttpServletResponse response){

    	FurnitureTypesInfo para = new FurnitureTypesInfo("","");
    	List<FurnitureTypesInfo> typeList = furnitureTypesInfoService.getFurnitureTypesInfoData(para);

        //导出操作
        FileUtil.exportExcel(typeList,"家具种类信息","家具种类",FurnitureTypesInfo.class,"家具种类信息.xls",response);
    }
    
    @RequestMapping("importExcel")
    @ResponseBody
    public void importExcel(final MultipartFile file){

    	List<FurnitureTypesInfo> typeList = FileUtil.importExcel(file,1,1,FurnitureTypesInfo.class);

        // 保存数据库
    	furnitureTypesInfoService.batchSaveData(typeList);
    }
}
