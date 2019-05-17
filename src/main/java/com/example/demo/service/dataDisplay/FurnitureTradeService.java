package com.example.demo.service.dataDisplay;
/*
 * @author Lin Lijian
 * @version 1.0.0
 * @since 1.0.0
 *
 * <MODIFICATION HISTORY>
 *  (Rev.)    (Date)        (Name)        (Comment)
 *  1.0.0     2019-05-13    Lin Lijian    New making
 */

import com.example.demo.entity.FurnitureAreaSaleTradeData;
import com.example.demo.entity.FurnitureHotSaleProductData;
import com.example.demo.entity.FurnitureHotSaleTradeData;
import com.example.demo.entity.FurnitureTypesInfo;
import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.repository.FurnitureAreaSaleTradeDataRepository;
import com.example.demo.repository.FurnitureHotSaleProductDataRepository;
import com.example.demo.repository.FurnitureHotSaleTradeDataRepository;
import com.example.demo.repository.FurnitureTypesInfoRepository;
import com.example.demo.repository.GlobalEshopInfoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FurnitureTradeService {

    @Autowired
    FurnitureTypesInfoRepository furnitureTypesInfoRepository;
    @Autowired
    FurnitureHotSaleTradeDataRepository furnitureHotSaleTradeDataRepository;
    @Autowired
    FurnitureHotSaleProductDataRepository furnitureHotSaleProductDataRepository;
    @Autowired
    FurnitureAreaSaleTradeDataRepository furnitureAreaSaleTradeDataRepository;
    @Autowired
    GlobalEshopInfoRepository globalEshopInfoRepository;

    // 产品类型列表
    public List<FurnitureTypesInfo> getProductTypeList(){
        return furnitureTypesInfoRepository.findAll();
    }

    // 热销产品各平台交易数据
    public List<FurnitureHotSaleTradeData> getHotProductSalesData(String[] filter){

        if(filter[1].length() > 0){
            return furnitureHotSaleTradeDataRepository.findAllByTradeDateAndTypeId(filter[0], filter[1]);
        }else{
            return furnitureHotSaleTradeDataRepository.findAllByTradeDate(filter[0]);
        }
    }
    
    public List<GlobalEshopInfo> getHotFurnitureEshopData(List<String> eshopNmList) {
		return globalEshopInfoRepository.findByEshopNmIn(eshopNmList);
	}

    public List<FurnitureHotSaleProductData> getHotBrandRankingData(){
        return furnitureHotSaleProductDataRepository.findAll();
    }

    public List<FurnitureAreaSaleTradeData> getAreaPlatformFurnitureSales(String tradeDate){
        return furnitureAreaSaleTradeDataRepository.findByTradeDate(tradeDate);
    }
}
