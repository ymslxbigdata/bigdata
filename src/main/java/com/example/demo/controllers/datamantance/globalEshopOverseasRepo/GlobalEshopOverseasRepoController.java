package com.example.demo.controllers.datamantance.globalEshopOverseasRepo;

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
import com.example.demo.entity.FurnitureHotSaleProductData;
import com.example.demo.entity.GlobalEshopOverseasRepo;
import com.example.demo.service.dataMantance.globalEshopOverseasRepo.GlobalEshopOverseasRepoService;

@Controller
@RequestMapping("dataMantance/globalEshopOverseasRepo")
public class GlobalEshopOverseasRepoController {
	

	@Autowired
	GlobalEshopOverseasRepoService globalEshopOverseasRepoService;
	
	@RequestMapping("/info") 
	public String getScreen(final Model model){
        return "dataMantance/globalEshopOverseasRepo/globalEshopOverseasRepo"; 
	}
    
    //获取全球跨境电商海外仓数据
    @RequestMapping(value="getGlobalEshopOverseasRepoData"
                  , method = RequestMethod.POST
                  , consumes = MediaType.APPLICATION_JSON_VALUE
                  , produces = MediaType.APPLICATION_JSON_VALUE
                  )
    @ResponseBody
    public List<GlobalEshopOverseasRepo> getGlobalEshopOverseasRepoData(@RequestBody final GlobalEshopOverseasRepo para) {
        	
    	return globalEshopOverseasRepoService.getGlobalEshopOverseasRepo(para);
    }
    
    //追加修改保存
    @RequestMapping(value="saveData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
            )
    @ResponseBody
    public void saveData(@RequestBody final GlobalEshopOverseasRepo para) {
  	
    	globalEshopOverseasRepoService.saveData(para);
    }
    
    //删除保存
    @RequestMapping(value="deleteData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
            )
    @ResponseBody
    public void deleteData(@RequestBody final GlobalEshopOverseasRepo para) {
  	
    	globalEshopOverseasRepoService.deleteData(para);;
    }
    
    @RequestMapping(value="export")
    @ResponseBody
    public void export(HttpServletResponse response){

    	GlobalEshopOverseasRepo para = new GlobalEshopOverseasRepo("","","","");
    	List<GlobalEshopOverseasRepo> productList = globalEshopOverseasRepoService.getGlobalEshopOverseasRepo(para);

        //导出操作
        FileUtil.exportExcel(productList,"海外仓信息","海外仓",GlobalEshopOverseasRepo.class,"海外仓信息.xls",response);
    }
    
    @RequestMapping("importExcel")
    @ResponseBody
    public void importExcel(final MultipartFile file){

    	List<GlobalEshopOverseasRepo> repoList = FileUtil.importExcel(file,1,1,GlobalEshopOverseasRepo.class);

        // 保存数据库
    	globalEshopOverseasRepoService.batchSaveData(repoList);
    }
}
