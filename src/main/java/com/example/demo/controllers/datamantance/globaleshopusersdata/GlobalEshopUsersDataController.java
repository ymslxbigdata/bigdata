package com.example.demo.controllers.datamantance.globaleshopusersdata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dataMantance/globalEshopUsersData")
public class GlobalEshopUsersDataController {

	
	  @RequestMapping("/info") 
	  public String getScreen(final Model model){
		  return "dataMantance/globalEshopUsersData/globalEshopUsersData"; 
	  }
}
