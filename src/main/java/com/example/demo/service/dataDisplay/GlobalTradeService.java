package com.example.demo.service.dataDisplay;
/*
 * @author Lin Lijian
 * @version 1.0.0
 * @since 1.0.0
 *
 * <MODIFICATION HISTORY>
 *  (Rev.)    (Date)        (Name)        (Comment)
 *  1.0.0     2019-05-12    Lin Lijian    New making
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.GlobalEshopTradeDataRepository;
import com.example.demo.repository.GlobalEshopUsersDataRepository;

@Service
public class GlobalTradeService {

    @Autowired
    GlobalEshopTradeDataRepository globalEshopTradeDataRepository;

    @Autowired
    GlobalEshopUsersDataRepository globalEshopUsersDataRepository;


	public List<Object[]> getDevelopedData(String tradeDate) {
		return globalEshopTradeDataRepository.getDevelopedData(tradeDate);
	}
	
	public List<Object[]> getDevelopingData(String tradeDate) {
		return globalEshopTradeDataRepository.getDevelopingData(tradeDate);
	}

	public List<Object[]> getXBorderTotalSales(String tradeDate) {
		return globalEshopTradeDataRepository.getXBorderTotalSales(tradeDate);
	}

	public List<Object[]> getMainStreamTotalSales(String tradeDate) {
		return globalEshopTradeDataRepository.getMainStreamTotalSales(tradeDate);
	}

	public List<Object[]> getMainStreamUserCnt() {
		return globalEshopTradeDataRepository.getMainStreamUserCnt();
	}
}
