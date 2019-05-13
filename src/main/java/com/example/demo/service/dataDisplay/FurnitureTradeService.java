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

import com.example.demo.entity.FurnitureHotSaleTradeData;
import com.example.demo.entity.FurnitureTypesInfo;
import com.example.demo.repository.FurnitureHotSaleTradeDataRepository;
import com.example.demo.repository.FurnitureTypesInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FurnitureTradeService {

    @Autowired
    FurnitureTypesInfoRepository furnitureTypesInfoRepository;

    @Autowired
    FurnitureHotSaleTradeDataRepository furnitureHotSaleTradeDataRepository;

    public List<FurnitureTypesInfo> getProductTypeList(){
        return furnitureTypesInfoRepository.findAll();
    }

    public List<FurnitureHotSaleTradeData> getHotProductSalesData(String[] filter){

        if(filter[1].length() > 0){
            return furnitureHotSaleTradeDataRepository.findAllByTradeDateAndTypeId(filter[0], filter[1]);
        }else{
            return furnitureHotSaleTradeDataRepository.findAllByTradeDate(filter[0]);
        }
    }
}
