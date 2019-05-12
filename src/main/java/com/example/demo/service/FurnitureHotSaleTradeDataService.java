package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.FurnitureHotSaleTradeData;
import com.example.demo.repository.FurnitureHotSaleTradeDataRepository;

@Service
public class FurnitureHotSaleTradeDataService {

	@Autowired
	FurnitureHotSaleTradeDataRepository furnitureHotSaleTradeDataRepository;
	
	public List<FurnitureHotSaleTradeData> getFurnitureHotSaleTradeData(FurnitureHotSaleTradeData furnitureHotSaleTradeData) {
		return furnitureHotSaleTradeDataRepository
				.findByTypeNmContainingAndProductNmContaining(furnitureHotSaleTradeData.getTypeNm(), furnitureHotSaleTradeData.getProductNm());
	}
	
	public void newOrModifyFurnitureHotSaleTradeData(FurnitureHotSaleTradeData furnitureHotSaleTradeData) {
		furnitureHotSaleTradeDataRepository.save(furnitureHotSaleTradeData);
	}
	
	public Optional<FurnitureHotSaleTradeData> getFurnitureHotSaleTradeDataDetail(String saleTradeId) {
		return furnitureHotSaleTradeDataRepository.findById(saleTradeId);
	}
	
	public void deleteFurnitureHotSaleTradeData(String saleTradeId) {
		furnitureHotSaleTradeDataRepository.deleteById(saleTradeId);
	}
}
