package com.example.demo.controllers.dashboard;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("dashboard/globalTrade")
public class GlobalTradeController {
	
	@RequestMapping("/info")
	public String getScreen(final Model model){
		  return "dashboard/globalTrade/globalTrade"; 
	  }

	@RequestMapping("/worldMap")
	public String getMap(){
	  	return "charts/worldMap";
	  }

	@RequestMapping(value="getDevelopingData"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public void getDevelopingData(@RequestBody final Date filterDate) {

	}

	@RequestMapping(value="getDevelopedData"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public void getDevelopedData() {

	}

	@RequestMapping(value="getXBorderTotalSales"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public void getXBorderTotalSales() {

	}

	@RequestMapping(value="getMainStreamTotalSales"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public void getMainStreamTotalSales() {

	}

	@RequestMapping(value="getMainStreamUserCnt"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public void getMainStreamUserCnt() {

	}

}
