package com.example.demo.controllers.datamantance.globaleshopinfo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dataMantance/globalEshopInfo")
public class GlobalEshopInfoController {

	
	  @RequestMapping("/info") 
	  public String getScreen(final Model model){
		  return "dataMantance/globalEshopInfo/globalEshopInfo"; 
	  }
}
