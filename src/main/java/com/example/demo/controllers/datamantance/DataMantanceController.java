package com.example.demo.controllers.datamantance;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dataMantance")
public class DataMantanceController {

	
	  @RequestMapping("/dataHome") 
	  public String getScreen(final Model model){
		  return "dataMantance/dataHome"; 
	  }
}
