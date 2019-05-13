package com.example.demo.service.dataMantance.furnitureHotSaleProductData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.example.demo.entity.FurnitureHotSaleProductData;
import com.example.demo.repository.FurnitureHotSaleProductDataRepository;

@Service
public class FurnitureHotSaleProductDataService {
	
	@Autowired
	FurnitureHotSaleProductDataRepository furnitureHotSaleProductDataRepository;
	
	public List<FurnitureHotSaleProductData> getFurnitureHotSaleProductData(FurnitureHotSaleProductData para) {
		
		
		List<FurnitureHotSaleProductData> dataList;
		
		String brandId = para.getBrandId();
		dataList = furnitureHotSaleProductDataRepository.findByBrandIdContainingAndBrandNmContaining(para.getBrandId(),para.getBrandNm());
		
		/*
		 * if(!StringUtils.isEmpty(brandId)) { dataList =
		 * furnitureHotSaleProductDataRepository.findByBrandId(brandId); } else {
		 * dataList = furnitureHotSaleProductDataRepository.findAll(); }
		 */
		
		return dataList;
	}
	
	public void saveData(FurnitureHotSaleProductData para) {
		furnitureHotSaleProductDataRepository.save(para);
	}
	
	public void deleteData(FurnitureHotSaleProductData para) {
		furnitureHotSaleProductDataRepository.delete(para);;
	}
}
