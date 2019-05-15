package com.example.demo.controllers.dashboard;
/*
 * @author Lin Lijian
 * @version 1.0.0
 * @since 1.0.0
 *
 * <MODIFICATION HISTORY>
 *  (Rev.)    (Date)        (Name)        (Comment)
 *  1.0.0     2019-05-11    Lin Lijian    New making
 */


import com.example.demo.entity.FurnitureHotSaleProductData;
import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.entity.GlobalEshopOverseasRepo;
import com.example.demo.service.dataDisplay.OverSeasTradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("dashboard/overseasTrade")
public class overseasTradeController {

    @Autowired
    OverSeasTradeService overSeasTradeService;

    @RequestMapping("/info")
    public String getScreen(final Model model){
        return "dashboard/overseasTrade/overseasTrade";
    }

    @RequestMapping("/worldMap")
    public String getMap(){
        return "charts/worldMap2";
    }

    @RequestMapping(value="getPlatFormList"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<GlobalEshopInfo> getPlatFormList(){
        return overSeasTradeService.getPlatFormList();
    }

    @RequestMapping(value="getOverSeasInventoryData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<GlobalEshopOverseasRepo> getOverSeasInventoryData(@RequestBody final String eshopId){
        return overSeasTradeService.getOverSeasInventoryData(eshopId);
    }


}