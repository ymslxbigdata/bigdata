package com.example.demo.controllers.dashboard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dashboard")
public class GlobalTradeController {

	
	  @RequestMapping("/globalTrade") 
	  public String getScreen(final Model model){
		  return "dashboard/globalTrade/globalTrade"; 
	  }
}
