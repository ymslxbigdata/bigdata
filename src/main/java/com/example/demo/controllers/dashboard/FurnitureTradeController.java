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


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dashboard/furnitureTrade")
public class FurnitureTradeController {


    @RequestMapping("/info")
    public String getScreen(final Model model){
        return "dashboard/furnitureTrade/furnitureTrade";
    }

    @RequestMapping("/worldMap")
    public String getMap(){
        return "charts/worldMap";
    }

    @RequestMapping("/areaPlatformFurnitureSales")
    public String getAreaPlatformFurnitureSales() {
        return "charts/areaPlatformFurnitureSales";
    }

    @RequestMapping("/hotBrandRanking")
    public String getHotBrandRanking(){
        return "charts/hotBrandRanking";
    }
}
