package com.example.demo.controllers.datamantance.globaleshoptradeData;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dataMantance/globalEshopTradeData")
public class GlobalEshopTradeDataController {

	
	  @RequestMapping("/info") 
	  public String getScreen(final Model model){
		  return "dataMantance/globalEshopTradeData/globalEshopTradeData"; 
	  }
}
