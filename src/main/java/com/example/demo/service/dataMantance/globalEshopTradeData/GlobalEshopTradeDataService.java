package com.example.demo.service.dataMantance.globalEshopTradeData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.entity.GlobalEshopTradeData;
import com.example.demo.repository.GlobalEshopInfoRepository;
import com.example.demo.repository.GlobalEshopTradeDataRepository;

@Service
public class GlobalEshopTradeDataService {
	
	@Autowired
	GlobalEshopInfoRepository globalEshopInfoRepository;
	
	@Autowired
	GlobalEshopTradeDataRepository globalEshopTradeDataRepository;
	
	public List<GlobalEshopInfo> getEshopOptions() {
		
		List<GlobalEshopInfo> dataList = globalEshopInfoRepository.findAll();
		return dataList;
	}
	
	public List<GlobalEshopTradeData> getGlobalEshopTradeData(GlobalEshopTradeData para) {
		
		List<GlobalEshopTradeData> dataList;
		
		String eshopNm = para.getEshopNm();
		String tradeMonth = para.getTradeMonth();
		
		if(!StringUtils.isEmpty(eshopNm) && !StringUtils.isEmpty(tradeMonth)) {
			dataList = globalEshopTradeDataRepository.findByEshopNmAndTradeMonth(eshopNm, tradeMonth);
		}
		else if(!StringUtils.isEmpty(eshopNm) && StringUtils.isEmpty(tradeMonth)) {
			dataList = globalEshopTradeDataRepository.findByEshopNm(eshopNm);
		}
		else if(StringUtils.isEmpty(eshopNm) && !StringUtils.isEmpty(tradeMonth)) {
			dataList = globalEshopTradeDataRepository.findByTradeMonth(tradeMonth);
		}
		else {
			dataList = globalEshopTradeDataRepository.findAll();
		}
		
		return dataList;
	}
}
