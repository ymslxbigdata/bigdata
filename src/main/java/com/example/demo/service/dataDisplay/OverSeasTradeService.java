package com.example.demo.service.dataDisplay;

import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.entity.GlobalEshopOverseasRepo;
import com.example.demo.repository.GlobalEshopInfoRepository;
import com.example.demo.repository.GlobalEshopOverseasRepoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @author Lin Lijian
 * @version 1.0.0
 * @since 1.0.0
 *
 * <MODIFICATION HISTORY>
 *  (Rev.)    (Date)        (Name)        (Comment)
 *  1.0.0     2019-05-13    Lin Lijian    New making
 */
@Service
public class OverSeasTradeService {

    @Autowired
    GlobalEshopOverseasRepoRepository globalEshopOverseasRepoRepository;

    @Autowired
    GlobalEshopInfoRepository globalEshopInfoRepository;

    public List<GlobalEshopOverseasRepo> getOverSeasInventoryData(String eshopId){
        if(eshopId.equals("findAll")) {
            return globalEshopOverseasRepoRepository.findAll();
        }else {
            return globalEshopOverseasRepoRepository.findByEshopId(eshopId);
        }
    }

    public List<GlobalEshopInfo> getPlatFormList(){
            return globalEshopInfoRepository.findAll();
    }

}
