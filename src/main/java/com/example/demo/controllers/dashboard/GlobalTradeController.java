package com.example.demo.controllers.dashboard;

import com.example.demo.beans.GlobalTradeDataModel;
import com.example.demo.service.dataDisplay.GlobalTradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("dashboard/globalTrade")
public class GlobalTradeController {
	
	@Autowired
	GlobalTradeService globalTradeService;

	@RequestMapping("/info")
	public String getScreen(final Model model){
		  return "dashboard/globalTrade/globalTrade"; 
	  }

	@RequestMapping("/worldMap")
	public String getMap(){
	  	return "charts/worldMap";
	  }

	@RequestMapping("/xBorderTotalSales")
	public String getXBorderTotalSalesChart() {
		return "charts/XBorderTotalSales";
	}

	@RequestMapping("/mainStreamTotalSales")
	public String getMainStreamTotalSalesChart(){
		return "charts/mainStreamTotalSales";
	}

	@RequestMapping("/mainStreamUserCnt")
	public String getMainStreamUserCntChart(){
		return "charts/mainStreamUserCnt";
	}

	@RequestMapping(value="getDevelopingData"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public List<Object[]> getDevelopingData(@RequestBody final String filterDate) {
		return globalTradeService.getDevelopingData(filterDate);
	}

	@RequestMapping(value="getDevelopedData"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public List<Object[]> getDevelopedData(@RequestBody final String filterDate) {
		return globalTradeService.getDevelopedData(filterDate);
	}

	@RequestMapping(value="getXBorderTotalSales"
			, method = RequestMethod.POST
			, consumes = MediaType.APPLICATION_JSON_VALUE
			, produces = MediaType.APPLICATION_JSON_VALUE
	)
	@ResponseBody
	public List<Object[]> getXBorderTotalSales(@RequestBody final String tradeDate) {
		return globalTradeService.getXBorderTotalSales(tradeDate);
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
