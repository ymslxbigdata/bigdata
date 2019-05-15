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
		
		String eshopId = para.getEshopId();
		String tradeDate = para.getTradeDate();
		
		if(!StringUtils.isEmpty(eshopId) && !StringUtils.isEmpty(tradeDate)) {
			dataList = globalEshopTradeDataRepository.findByEshopIdAndTradeDate(eshopId, tradeDate);
		}
		else if(!StringUtils.isEmpty(eshopId) && StringUtils.isEmpty(tradeDate)) {
			dataList = globalEshopTradeDataRepository.findByEshopId(eshopId);
		}
		else if(StringUtils.isEmpty(eshopId) && !StringUtils.isEmpty(tradeDate)) {
			dataList = globalEshopTradeDataRepository.findByTradeDate(tradeDate);
		}
		else {
			dataList = globalEshopTradeDataRepository.findAll();
		}
		
		return dataList;
	}
	
	public void saveData(GlobalEshopTradeData para) {
		globalEshopTradeDataRepository.save(para);
	}
	
	public void deleteData(GlobalEshopTradeData para) {
		globalEshopTradeDataRepository.delete(para);;
	}

	public void batchSaveData(List<GlobalEshopTradeData> tradeDataList) {
		globalEshopTradeDataRepository.saveAll(tradeDataList);
	}
}
