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


import com.example.demo.entity.FurnitureAreaSaleTradeData;
import com.example.demo.entity.FurnitureHotSaleProductData;
import com.example.demo.entity.FurnitureHotSaleTradeData;
import com.example.demo.entity.FurnitureTypesInfo;
import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.service.dataDisplay.FurnitureTradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("dashboard/furnitureTrade")
public class FurnitureTradeController {

    @Autowired
    FurnitureTradeService furnitureTradeService;

    @RequestMapping("/info")
    public String getScreen(final Model model){
        return "dashboard/furnitureTrade/furnitureTrade";
    }

    @RequestMapping("/worldMap")
    public String getMap(){
        return "charts/worldMap";
    }

    @RequestMapping("/areaPlatformFurnitureSales")
    public String getAreaPlatformFurnitureSalesChart() {
        return "charts/areaPlatformFurnitureSales";
    }

    @RequestMapping("/hotBrandRanking")
    public String getHotBrandRankingChart(){
        return "charts/hotBrandRanking";
    }

    @RequestMapping(value="getProductTypeList"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseBody
    public List<FurnitureTypesInfo> getProductTypeList(){ return furnitureTradeService.getProductTypeList(); }


    @RequestMapping(value="getHotProductSalesData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseBody
    public List<FurnitureHotSaleTradeData> getHotProductSalesData(@RequestBody final String[] filter){
        return furnitureTradeService.getHotProductSalesData(filter);
    }

    @RequestMapping(value="getHotBrandRanking"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseBody
    public List<FurnitureHotSaleProductData> getHotBrandRankingData(){
        return furnitureTradeService.getHotBrandRankingData();
    }

    @RequestMapping(value="getAreaPlatformFurnitureSales"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseBody
    public List<FurnitureAreaSaleTradeData> getAreaPlatformFurnitureSales(@RequestBody final String tradeDate){
        return furnitureTradeService.getAreaPlatformFurnitureSales(tradeDate);
    }

    @RequestMapping(value="getHotFurnitureEshopData"
            , method = RequestMethod.POST
            , consumes = MediaType.APPLICATION_JSON_VALUE
            , produces = MediaType.APPLICATION_JSON_VALUE
    )
    @ResponseBody
    public List<GlobalEshopInfo> getHotFurnitureEshopData(@RequestBody final List<String> eshopNmList){
        return furnitureTradeService.getHotFurnitureEshopData(eshopNmList);
    }
}
