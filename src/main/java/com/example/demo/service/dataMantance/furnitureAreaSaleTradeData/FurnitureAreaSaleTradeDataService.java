package com.example.demo.service.dataMantance.furnitureAreaSaleTradeData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.example.demo.entity.FurnitureAreaSaleTradeData;
import com.example.demo.repository.FurnitureAreaSaleTradeDataRepository;

@Service
public class FurnitureAreaSaleTradeDataService {
	
	@Autowired
	FurnitureAreaSaleTradeDataRepository furnitureAreaSaleTradeDataRepository;
	
	public List<FurnitureAreaSaleTradeData> getFurnitureAreaSaleTradeData(FurnitureAreaSaleTradeData para) {
		
		List<FurnitureAreaSaleTradeData> dataList;
		String tradeDate = para.getTradeDate();
		
		if(!StringUtils.isEmpty(tradeDate)) {
			dataList = furnitureAreaSaleTradeDataRepository.findByTradeDate(tradeDate);
		}
		else {
			dataList = furnitureAreaSaleTradeDataRepository.findAll();
		}
		
		return dataList;
	}
	
	public void saveData(FurnitureAreaSaleTradeData para) {
		furnitureAreaSaleTradeDataRepository.save(para);
	}
	
	public void deleteData(FurnitureAreaSaleTradeData para) {
		furnitureAreaSaleTradeDataRepository.delete(para);;
	}

	public void batchSaveData(List<FurnitureAreaSaleTradeData> tradeDataList) {
		furnitureAreaSaleTradeDataRepository.saveAll(tradeDataList);
	}
}
